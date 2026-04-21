module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c4_i32 = arith.constant 4 : i32
    %2 = arith.remsi %arg3, %c4_i32 : i32
    %c1_i32 = arith.constant 1 : i32
    %3 = arith.addi %arg0, %c1_i32 : i32
    %4 = "simt_step.switch"(%2, %3) ({
    ^bb0(%arg4: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %7:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %15 = arith.remsi %arg3, %c4_i32_8 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %16 = arith.addi %15, %c1_i32_9 : i32
        %17 = arith.cmpi slt, %arg6, %16 : i32
        "simt_step.condition"(%17, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %16 = "simt_step.if"(%15) ({
          %true_10 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %19 = arith.muli %arg6, %c4_i32_11 : i32
          %20 = arith.addi %c16_i32, %19 : i32
          %21 = arith.addi %20, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) : (i32) -> ()
        }, {
          %true_10 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %19 = arith.muli %arg6, %c4_i32_11 : i32
          %20 = arith.addi %c32_i32, %19 : i32
          %21 = arith.addi %20, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_9 = arith.constant 1 : i32
        %17 = arith.addi %arg6, %c1_i32_9 : i32
        "simt_step.yield"(%16, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%7#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      %true_3 = arith.constant true
      %9 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      %c48_i32 = arith.constant 48 : i32
      %10 = arith.addi %c48_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %10, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    ^bb2(%11: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %15 = arith.remsi %arg3, %c4_i32_8 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %16 = arith.addi %15, %c1_i32_9 : i32
        %17 = arith.cmpi slt, %arg6, %16 : i32
        "simt_step.condition"(%17, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c3_i32 = arith.constant 3 : i32
        %15 = arith.remsi %arg3, %c3_i32 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %16 = "simt_step.switch"(%15, %c4_i32_8) ({
        ^bb0(%arg7: i32):
          %true_10 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %19 = arith.muli %arg6, %c4_i32_11 : i32
          %20 = arith.addi %c64_i32, %19 : i32
          %21 = arith.addi %20, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        ^bb1(%22: i32):  // no predecessors
          %true_12 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %24 = arith.muli %arg6, %c4_i32_13 : i32
          %25 = arith.addi %c80_i32, %24 : i32
          %26 = arith.addi %25, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
        ^bb2(%27: i32):  // no predecessors
          %true_14 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %29 = arith.muli %arg6, %c4_i32_15 : i32
          %30 = arith.addi %c96_i32, %29 : i32
          %31 = arith.addi %30, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %c1_i32_9 = arith.constant 1 : i32
        %17 = arith.addi %arg6, %c1_i32_9 : i32
        "simt_step.yield"(%16, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%12#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%13: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %15 = arith.remsi %arg3, %c4_i32_8 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %16 = arith.addi %15, %c1_i32_9 : i32
        %17 = arith.cmpi slt, %arg6, %16 : i32
        "simt_step.condition"(%17, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %16 = "simt_step.if"(%15) ({
          %true_10 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %19 = arith.muli %arg6, %c4_i32_11 : i32
          %20 = arith.addi %c112_i32, %19 : i32
          %21 = arith.addi %20, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) : (i32) -> ()
        }, {
          %true_10 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %19 = arith.muli %arg6, %c4_i32_11 : i32
          %20 = arith.addi %c128_i32, %19 : i32
          %21 = arith.addi %20, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_9 = arith.constant 1 : i32
        %17 = arith.addi %arg6, %c1_i32_9 : i32
        "simt_step.yield"(%16, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %6 = arith.select %5, %0, %4 : i32
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
    %7 = simt_step.subgroup_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %21 = simt_step.subgroup_id
      %22 = arith.index_cast %21 : index to i32
      %true_1 = arith.constant true
      %c144_i32 = arith.constant 144 : i32
      %23 = arith.addi %c144_i32, %0 : i32
      %true_2 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb1(%25: i32):  // no predecessors
      %c12_i32 = arith.constant 12 : i32
      %26 = arith.addi %c12_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %28 = arith.cmpi ne, %27, %c0_i32_3 : i32
      %29 = "simt_step.if"(%28) ({
        %c16_i32 = arith.constant 16 : i32
        %32 = arith.addi %c16_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_5 : i32
        %35 = "simt_step.if"(%34) ({
          %38 = simt_step.subgroup_id
          %39 = arith.index_cast %38 : index to i32
          "simt_step.yield"(%39) : (i32) -> ()
        }, {
          %38 = simt_step.subgroup_id
          %39 = arith.index_cast %38 : index to i32
          "simt_step.yield"(%39) : (i32) -> ()
        }) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %36 = arith.addi %c160_i32, %0 : i32
        %true_6 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35) : (i32) -> ()
      }, {
        %c20_i32 = arith.constant 20 : i32
        %32 = arith.addi %c20_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %34 = simt_step.lane_id
        %35 = arith.index_cast %34 : index to i32
        %36 = "simt_step.switch"(%33, %35) ({
        ^bb0(%arg3: i32):
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = true} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          %38 = simt_step.subgroup_id
          %39 = arith.index_cast %38 : index to i32
          %true_5 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %40 = arith.addi %c176_i32, %0 : i32
          %true_6 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%36) : (i32) -> ()
      }) : (i1) -> i32
      %c192_i32 = arith.constant 192 : i32
      %30 = arith.addi %c192_i32, %0 : i32
      %true_4 = arith.constant true
      %31 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %c24_i32 = arith.constant 24 : i32
    %10 = arith.addi %c24_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %12 = simt_step.lane_id
    %13 = arith.index_cast %12 : index to i32
    %14 = "simt_step.switch"(%11, %13) ({
    ^bb0(%arg2: i32):
      %c28_i32 = arith.constant 28 : i32
      %21 = arith.addi %c28_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_1 : i32
      %24 = "simt_step.if"(%23) ({
        %40 = simt_step.subgroup_id
        %41 = arith.index_cast %40 : index to i32
        "simt_step.yield"(%41) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %40:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %41 = arith.muli %arg4, %c4_i32_9 : i32
          %42 = arith.addi %41, %0 : i32
          %c32_i32 = arith.constant 32 : i32
          %43 = arith.addi %c32_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_10 : i32
          "simt_step.condition"(%45, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %41 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %42 = arith.addi %arg4, %c1_i32 : i32
          %true_9 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %43 = arith.muli %arg4, %c4_i32_10 : i32
          %44 = arith.addi %c208_i32, %43 : i32
          %45 = arith.addi %44, %0 : i32
          %true_11 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%40#0) : (i32) -> ()
      }) : (i1) -> i32
      %c224_i32 = arith.constant 224 : i32
      %25 = arith.addi %c224_i32, %0 : i32
      %true_2 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_3 = arith.constant true
      %c240_i32 = arith.constant 240 : i32
      %27 = arith.addi %c240_i32, %0 : i32
      %true_4 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb1(%29: i32):  // no predecessors
      %c52_i32 = arith.constant 52 : i32
      %30 = arith.addi %c52_i32, %0 : i32
      %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
      %32 = simt_step.subgroup_id
      %33 = arith.index_cast %32 : index to i32
      %34 = "simt_step.switch"(%31, %33) ({
      ^bb0(%arg3: i32):
        %c56_i32 = arith.constant 56 : i32
        %40 = arith.addi %c56_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_7 : i32
        %43 = "simt_step.if"(%42) ({
          %64 = simt_step.subgroup_id
          %65 = arith.index_cast %64 : index to i32
          "simt_step.yield"(%65) : (i32) -> ()
        }, {
          %64 = simt_step.subgroup_id
          %65 = arith.index_cast %64 : index to i32
          "simt_step.yield"(%65) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32 = arith.constant 256 : i32
        %44 = arith.addi %c256_i32, %0 : i32
        %true_8 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_9 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %46 = arith.addi %c272_i32, %0 : i32
        %true_10 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      ^bb1(%48: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %49 = arith.addi %c60_i32, %0 : i32
        %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %51 = arith.cmpi ne, %50, %c0_i32_11 : i32
        %52 = "simt_step.if"(%51) ({
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }, {
          %64 = simt_step.lane_id
          %65 = arith.index_cast %64 : index to i32
          "simt_step.yield"(%65) : (i32) -> ()
        }) : (i1) -> i32
        %c288_i32 = arith.constant 288 : i32
        %53 = arith.addi %c288_i32, %0 : i32
        %true_12 = arith.constant true
        %54 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_13 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %55 = arith.addi %c304_i32, %0 : i32
        %true_14 = arith.constant true
        %56 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%52) {fallthrough = true} : (i32) -> ()
      ^bb2(%57: i32):  // no predecessors
        %c64_i32 = arith.constant 64 : i32
        %58 = arith.addi %c64_i32, %0 : i32
        %59 = "simt_step.buffer.load"(%arg1, %58) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %60 = arith.cmpi ne, %59, %c0_i32_15 : i32
        %61 = "simt_step.if"(%60) ({
          %64 = simt_step.subgroup_id
          %65 = arith.index_cast %64 : index to i32
          "simt_step.yield"(%65) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c320_i32 = arith.constant 320 : i32
        %62 = arith.addi %c320_i32, %0 : i32
        %true_16 = arith.constant true
        %63 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
    ^bb2(%35: i32):  // no predecessors
      %36 = simt_step.subgroup_id
      %37 = arith.index_cast %36 : index to i32
      "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
    ^bb3(%38: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %39:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %40 = arith.muli %arg4, %c4_i32_7 : i32
        %41 = arith.addi %40, %0 : i32
        %c68_i32 = arith.constant 68 : i32
        %42 = arith.addi %c68_i32, %41 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %44 = arith.cmpi ne, %43, %c0_i32_8 : i32
        "simt_step.condition"(%44, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %40 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %41 = arith.addi %arg4, %c1_i32 : i32
        %true_7 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %42 = arith.muli %arg4, %c4_i32_8 : i32
        %43 = arith.addi %c336_i32, %42 : i32
        %44 = arith.addi %43, %0 : i32
        %true_9 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%40, %41) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%39#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %c88_i32 = arith.constant 88 : i32
    %15 = arith.addi %c88_i32, %0 : i32
    %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %17 = arith.cmpi ne, %16, %c0_i32_0 : i32
    %18 = "simt_step.if"(%17) ({
      %21 = simt_step.lane_id
      %22 = arith.index_cast %21 : index to i32
      "simt_step.yield"(%22) : (i32) -> ()
    }, {
      "simt_step.yield"(%0) : (i32) -> ()
    }) : (i1) -> i32
    %c352_i32 = arith.constant 352 : i32
    %19 = arith.addi %c352_i32, %0 : i32
    %true = arith.constant true
    %20 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

