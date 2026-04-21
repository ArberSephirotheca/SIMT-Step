module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %2 = simt_step.lane_id
    %3 = arith.index_cast %2 : index to i32
    %4 = "simt_step.switch"(%arg3, %3) ({
    ^bb0(%arg4: i32):
      %true_3 = arith.constant true
      %11 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %12 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11) {fallthrough = true} : (i32) -> ()
    ^bb1(%13: i32):  // no predecessors
      %true_4 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %15 = arith.addi %c32_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %6 = arith.select %5, %0, %4 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %8 = "simt_step.if"(%7) ({
      %c0_i32_3 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
      %12 = "simt_step.if"(%11) ({
        %true_4 = arith.constant true
        %13 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %14 = arith.addi %c48_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%13) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %13 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %14 = "simt_step.if"(%13) ({
          %true_5 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %16 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) : (i32) -> ()
        }, {
          %true_5 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %16 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%14) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%12) : (i32) -> ()
    }, {
      %c2_i32 = arith.constant 2 : i32
      %11 = arith.remsi %arg3, %c2_i32 : i32
      %12 = simt_step.lane_id
      %13 = arith.index_cast %12 : index to i32
      %14 = "simt_step.switch"(%11, %13) ({
      ^bb0(%arg4: i32):
        %c3_i32 = arith.constant 3 : i32
        %15 = arith.remsi %arg3, %c3_i32 : i32
        %16 = simt_step.lane_id
        %17 = arith.index_cast %16 : index to i32
        %18 = "simt_step.switch"(%15, %17) ({
        ^bb0(%arg5: i32):
          %true_4 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %27 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %true_5 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %30 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %true_6 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %33 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %20 = simt_step.subgroup_id
        %21 = arith.index_cast %20 : index to i32
        %22 = "simt_step.switch"(%arg3, %21) ({
        ^bb0(%arg5: i32):
          %true_4 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %27 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %true_5 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %30 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb2(%23: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %25 = "simt_step.if"(%24) ({
          %true_4 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %27 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) : (i32) -> ()
        }, {
          %true_4 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %27 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%14) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %9 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %10 = arith.select %9, %6, %8 : i32
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
    %c8_i32 = arith.constant 8 : i32
    %7 = arith.addi %c8_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %9 = "simt_step.switch"(%8, %0) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %18 = arith.addi %c12_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %20 = simt_step.lane_id
      %21 = arith.index_cast %20 : index to i32
      %22 = "simt_step.switch"(%19, %21) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %31 = arith.addi %c16_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %33 = "simt_step.switch"(%32, %c0_i32_7) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %true_17 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %47 = arith.addi %c208_i32, %0 : i32
          %true_18 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%49: i32):  // no predecessors
          %50 = simt_step.lane_id
          %51 = arith.index_cast %50 : index to i32
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %34 = arith.addi %c224_i32, %0 : i32
        %true_9 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_10 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %36 = arith.addi %c240_i32, %0 : i32
        %true_11 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        %c4_i32_12 = arith.constant 4 : i32
        %true_13 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %39 = arith.addi %c256_i32, %0 : i32
        %true_14 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c4_i32_12) {fallthrough = false} : (i32) -> ()
      ^bb2(%41: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %42:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_17 : i32
          %47 = arith.addi %46, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %48 = arith.addi %c20_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_18 : i32
          "simt_step.condition"(%50, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %46 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %arg5, %c1_i32 : i32
          %true_17 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %48 = arith.muli %arg5, %c4_i32_18 : i32
          %49 = arith.addi %c272_i32, %48 : i32
          %50 = arith.addi %49, %0 : i32
          %true_19 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%42#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%43: i32):  // no predecessors
        %44 = simt_step.subgroup_id
        %45 = arith.index_cast %44 : index to i32
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %24:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %31 = arith.muli %arg4, %c4_i32_7 : i32
        %32 = arith.addi %31, %0 : i32
        %c40_i32 = arith.constant 40 : i32
        %33 = arith.addi %c40_i32, %32 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_8 : i32
        "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %31 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %32 = arith.addi %arg4, %c1_i32 : i32
        %true_7 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %33 = arith.muli %arg4, %c4_i32_8 : i32
        %34 = arith.addi %c288_i32, %33 : i32
        %35 = arith.addi %34, %0 : i32
        %true_9 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31, %32) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%24#0) {fallthrough = true} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c60_i32 = arith.constant 60 : i32
      %26 = arith.addi %c60_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %28 = "simt_step.switch"(%27, %0) ({
      ^bb0(%arg3: i32):
        %c64_i32 = arith.constant 64 : i32
        %31 = arith.addi %c64_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %33 = "simt_step.switch"(%32, %0) ({
        ^bb0(%arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %41 = arith.addi %0, %c4_i32_9 : i32
          "simt_step.yield"(%41) {fallthrough = true} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          %c0_i32_10 = arith.constant 0 : i32
          %true_11 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %43 = arith.addi %c304_i32, %0 : i32
          %true_12 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_10) {fallthrough = true} : (i32) -> ()
        ^bb2(%45: i32):  // no predecessors
          %46 = simt_step.subgroup_id
          %47 = arith.index_cast %46 : index to i32
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        ^bb3(%48: i32):  // no predecessors
          %49 = simt_step.lane_id
          %50 = arith.index_cast %49 : index to i32
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb1(%34: i32):  // no predecessors
        %c68_i32 = arith.constant 68 : i32
        %35 = arith.addi %c68_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %37 = arith.addi %0, %c3_i32 : i32
        %38 = "simt_step.switch"(%36, %37) ({
        ^bb0(%arg4: i32):
          %41 = simt_step.lane_id
          %42 = arith.index_cast %41 : index to i32
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          %44 = simt_step.subgroup_id
          %45 = arith.index_cast %44 : index to i32
          "simt_step.yield"(%45) {fallthrough = true} : (i32) -> ()
        ^bb2(%46: i32):  // no predecessors
          %47 = simt_step.lane_id
          %48 = arith.index_cast %47 : index to i32
          %true_9 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %49 = arith.addi %c320_i32, %0 : i32
          %true_10 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %39 = arith.addi %c336_i32, %0 : i32
        %true_8 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      %c352_i32 = arith.constant 352 : i32
      %29 = arith.addi %c352_i32, %0 : i32
      %true_6 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c368_i32 = arith.constant 368 : i32
    %10 = arith.addi %c368_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c72_i32 = arith.constant 72 : i32
    %12 = arith.addi %c72_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %14 = arith.cmpi ne, %13, %c0_i32_1 : i32
    %15 = "simt_step.if"(%14) ({
      %c76_i32 = arith.constant 76 : i32
      %18 = arith.addi %c76_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %20 = "simt_step.switch"(%19, %c0_i32_3) ({
      ^bb0(%arg2: i32):
        %c80_i32 = arith.constant 80 : i32
        %23 = arith.addi %c80_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_6 : i32
        %26 = "simt_step.if"(%25) ({
          %38 = simt_step.lane_id
          %39 = arith.index_cast %38 : index to i32
          "simt_step.yield"(%39) : (i32) -> ()
        }, {
          %38 = simt_step.subgroup_id
          %39 = arith.index_cast %38 : index to i32
          "simt_step.yield"(%39) : (i32) -> ()
        }) : (i1) -> i32
        %c384_i32 = arith.constant 384 : i32
        %27 = arith.addi %c384_i32, %0 : i32
        %true_7 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      ^bb1(%29: i32):  // no predecessors
        %c84_i32 = arith.constant 84 : i32
        %30 = arith.addi %c84_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_8 : i32
        %33 = "simt_step.if"(%32) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %38 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%38) : (i32) -> ()
        }) : (i1) -> i32
        %c400_i32 = arith.constant 400 : i32
        %34 = arith.addi %c400_i32, %0 : i32
        %true_9 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_10 = arith.constant true
        %c416_i32 = arith.constant 416 : i32
        %36 = arith.addi %c416_i32, %0 : i32
        %true_11 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %c432_i32 = arith.constant 432 : i32
      %21 = arith.addi %c432_i32, %0 : i32
      %true_5 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) : (i32) -> ()
    }, {
      %c88_i32 = arith.constant 88 : i32
      %18 = arith.addi %c88_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %20 = "simt_step.switch"(%19, %0) ({
      ^bb0(%arg2: i32):
        %c92_i32 = arith.constant 92 : i32
        %21 = arith.addi %c92_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_3 : i32
        %24 = "simt_step.if"(%23) ({
          %36 = simt_step.lane_id
          %37 = arith.index_cast %36 : index to i32
          "simt_step.yield"(%37) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c448_i32 = arith.constant 448 : i32
        %25 = arith.addi %c448_i32, %0 : i32
        %true_4 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %c96_i32 = arith.constant 96 : i32
        %28 = arith.addi %c96_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_5 : i32
        %31 = "simt_step.if"(%30) ({
          %c2_i32 = arith.constant 2 : i32
          %36 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%36) : (i32) -> ()
        }, {
          %36 = simt_step.lane_id
          %37 = arith.index_cast %36 : index to i32
          "simt_step.yield"(%37) : (i32) -> ()
        }) : (i1) -> i32
        %c464_i32 = arith.constant 464 : i32
        %32 = arith.addi %c464_i32, %0 : i32
        %true_6 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_7 = arith.constant true
        %c480_i32 = arith.constant 480 : i32
        %34 = arith.addi %c480_i32, %0 : i32
        %true_8 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%20) : (i32) -> ()
    }) : (i1) -> i32
    %c496_i32 = arith.constant 496 : i32
    %16 = arith.addi %c496_i32, %0 : i32
    %true_2 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

