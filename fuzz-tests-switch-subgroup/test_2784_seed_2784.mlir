module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %2:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %11 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %11, %c1_i32 : i32
      %13 = arith.cmpi slt, %arg5, %12 : i32
      "simt_step.condition"(%13, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true_5 = arith.constant true
      %11 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %c4_i32 = arith.constant 4 : i32
      %12 = arith.muli %arg5, %c4_i32 : i32
      %13 = arith.addi %c16_i32, %12 : i32
      %14 = arith.addi %13, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %14, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.break"(%11, %15) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %0, %2#0 : i32
    %c3_i32 = arith.constant 3 : i32
    %5 = arith.remsi %arg3, %c3_i32 : i32
    %c2_i32 = arith.constant 2 : i32
    %6 = "simt_step.switch"(%5, %c2_i32) ({
    ^bb0(%arg4: i32):
      %true_5 = arith.constant true
      %11 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %12 = arith.addi %c32_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
    ^bb1(%13: i32):  // no predecessors
      %true_6 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      %c48_i32 = arith.constant 48 : i32
      %15 = arith.addi %c48_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb2(%16: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
      %18 = "simt_step.if"(%17) ({
        %c0_i32_9 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %23 = "simt_step.if"(%22) ({
          %true_10 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %25 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) : (i32) -> ()
        }, {
          %true_10 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %25 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%23) : (i32) -> ()
      }, {
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %23 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %24 = arith.addi %23, %c1_i32 : i32
          %25 = arith.cmpi slt, %arg6, %24 : i32
          "simt_step.condition"(%25, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_11 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32 = arith.constant 4 : i32
          %24 = arith.muli %arg6, %c4_i32 : i32
          %25 = arith.addi %c96_i32, %24 : i32
          %26 = arith.addi %25, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %27 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.break"(%23, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%22#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb3(%19: i32):  // no predecessors
      %true_8 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      %c112_i32 = arith.constant 112 : i32
      %21 = arith.addi %c112_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    %c128_i32 = arith.constant 128 : i32
    %8 = arith.addi %c128_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %8, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_4 = arith.constant 0 : i32
    %9 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
    %10 = arith.select %9, %4, %6 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_3 = arith.constant 4 : i32
      %9 = arith.muli %arg3, %c4_i32_3 : i32
      %10 = arith.addi %9, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %11 = arith.addi %c8_i32, %10 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_4 : i32
      "simt_step.condition"(%13, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %9 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %10 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c144_i32 = arith.constant 144 : i32
      %c4_i32_3 = arith.constant 4 : i32
      %11 = arith.muli %arg3, %c4_i32_3 : i32
      %12 = arith.addi %c144_i32, %11 : i32
      %13 = arith.addi %12, %0 : i32
      %true_4 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%9, %10) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c28_i32 = arith.constant 28 : i32
    %6 = arith.addi %c28_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %8 = "simt_step.switch"(%7, %c0_i32_2) ({
    ^bb0(%arg2: i32):
      %c32_i32 = arith.constant 32 : i32
      %9 = arith.addi %c32_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %11 = simt_step.lane_id
      %12 = arith.index_cast %11 : index to i32
      %13 = "simt_step.switch"(%10, %12) ({
      ^bb0(%arg3: i32):
        %c36_i32 = arith.constant 36 : i32
        %28 = arith.addi %c36_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %30 = simt_step.lane_id
        %31 = arith.index_cast %30 : index to i32
        %32 = "simt_step.switch"(%29, %31) ({
        ^bb0(%arg4: i32):
          %51 = simt_step.lane_id
          %52 = arith.index_cast %51 : index to i32
          %true_17 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %53 = arith.addi %c160_i32, %0 : i32
          %true_18 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        ^bb1(%55: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%56: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %33 = arith.addi %c176_i32, %0 : i32
        %true_7 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      ^bb1(%35: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %36:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %51 = arith.muli %arg5, %c4_i32_17 : i32
          %52 = arith.addi %51, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %53 = arith.addi %c40_i32, %52 : i32
          %54 = "simt_step.buffer.load"(%arg1, %53) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %55 = arith.cmpi ne, %54, %c0_i32_18 : i32
          "simt_step.condition"(%55, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %51 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %52 = arith.addi %arg5, %c1_i32 : i32
          %true_17 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %53 = arith.muli %arg5, %c4_i32_18 : i32
          %54 = arith.addi %c192_i32, %53 : i32
          %55 = arith.addi %54, %0 : i32
          %true_19 = arith.constant true
          %56 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%51, %52) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_10 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %37 = arith.addi %c208_i32, %0 : i32
        %true_11 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%39: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %40 = arith.addi %c60_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %42 = arith.addi %0, %c0_i32_12 : i32
        %43 = "simt_step.switch"(%41, %42) ({
        ^bb0(%arg4: i32):
          %51 = simt_step.lane_id
          %52 = arith.index_cast %51 : index to i32
          %true_17 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %53 = arith.addi %c224_i32, %0 : i32
          %true_18 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        ^bb1(%55: i32):  // no predecessors
          %56 = simt_step.subgroup_id
          %57 = arith.index_cast %56 : index to i32
          "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %44 = arith.addi %c240_i32, %0 : i32
        %true_14 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) {fallthrough = true} : (i32) -> ()
      ^bb3(%46: i32):  // no predecessors
        %47 = simt_step.lane_id
        %48 = arith.index_cast %47 : index to i32
        %true_15 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %49 = arith.addi %c256_i32, %0 : i32
        %true_16 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%13) {fallthrough = true} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c64_i32 = arith.constant 64 : i32
      %15 = arith.addi %c64_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %17 = "simt_step.switch"(%16, %0) ({
      ^bb0(%arg3: i32):
        %c68_i32 = arith.constant 68 : i32
        %28 = arith.addi %c68_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_6 : i32
        %31 = "simt_step.if"(%30) ({
          %c1_i32 = arith.constant 1 : i32
          %42 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%42) : (i32) -> ()
        }, {
          %42 = simt_step.subgroup_id
          %43 = arith.index_cast %42 : index to i32
          "simt_step.yield"(%43) : (i32) -> ()
        }) : (i1) -> i32
        %c272_i32 = arith.constant 272 : i32
        %32 = arith.addi %c272_i32, %0 : i32
        %true_7 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb1(%34: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %42 = arith.muli %arg5, %c4_i32_16 : i32
          %43 = arith.addi %42, %0 : i32
          %c72_i32 = arith.constant 72 : i32
          %44 = arith.addi %c72_i32, %43 : i32
          %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %46 = arith.cmpi ne, %45, %c0_i32_17 : i32
          "simt_step.condition"(%46, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %42 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %43 = arith.addi %arg5, %c1_i32 : i32
          %true_16 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_17 : i32
          %45 = arith.addi %c288_i32, %44 : i32
          %46 = arith.addi %45, %0 : i32
          %true_18 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42, %43) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_10 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %36 = arith.addi %c304_i32, %0 : i32
        %true_11 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%38: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %42 = arith.muli %arg5, %c4_i32_16 : i32
          %43 = arith.addi %42, %0 : i32
          %c92_i32 = arith.constant 92 : i32
          %44 = arith.addi %c92_i32, %43 : i32
          %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %46 = arith.cmpi ne, %45, %c0_i32_17 : i32
          "simt_step.condition"(%46, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %42 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %43 = arith.addi %arg5, %c1_i32 : i32
          %true_16 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_17 : i32
          %45 = arith.addi %c320_i32, %44 : i32
          %46 = arith.addi %45, %0 : i32
          %true_18 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42, %43) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_14 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %40 = arith.addi %c336_i32, %0 : i32
        %true_15 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c352_i32 = arith.constant 352 : i32
      %18 = arith.addi %c352_i32, %0 : i32
      %true_3 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_4 = arith.constant true
      %c368_i32 = arith.constant 368 : i32
      %20 = arith.addi %c368_i32, %0 : i32
      %true_5 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c112_i32 = arith.constant 112 : i32
      %23 = arith.addi %c112_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %25 = simt_step.lane_id
      %26 = arith.index_cast %25 : index to i32
      %27 = "simt_step.switch"(%24, %26) ({
      ^bb0(%arg3: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %51 = arith.muli %arg5, %c4_i32_20 : i32
          %52 = arith.addi %51, %0 : i32
          %c116_i32 = arith.constant 116 : i32
          %53 = arith.addi %c116_i32, %52 : i32
          %54 = "simt_step.buffer.load"(%arg1, %53) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %55 = arith.cmpi ne, %54, %c0_i32_21 : i32
          "simt_step.condition"(%55, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %51 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %52 = arith.addi %arg5, %c1_i32 : i32
          %true_20 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %53 = arith.muli %arg5, %c4_i32_21 : i32
          %54 = arith.addi %c384_i32, %53 : i32
          %55 = arith.addi %54, %0 : i32
          %true_22 = arith.constant true
          %56 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%51, %52) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_8 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %29 = arith.addi %c400_i32, %0 : i32
        %true_9 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c136_i32 = arith.constant 136 : i32
        %32 = arith.addi %c136_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_10 : i32
        %35 = "simt_step.if"(%34) ({
          %51 = simt_step.lane_id
          %52 = arith.index_cast %51 : index to i32
          "simt_step.yield"(%52) : (i32) -> ()
        }, {
          %51 = simt_step.subgroup_id
          %52 = arith.index_cast %51 : index to i32
          "simt_step.yield"(%52) : (i32) -> ()
        }) : (i1) -> i32
        %c416_i32 = arith.constant 416 : i32
        %36 = arith.addi %c416_i32, %0 : i32
        %true_11 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_12 = arith.constant true
        %c432_i32 = arith.constant 432 : i32
        %38 = arith.addi %c432_i32, %0 : i32
        %true_13 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      ^bb2(%40: i32):  // no predecessors
        %c140_i32 = arith.constant 140 : i32
        %41 = arith.addi %c140_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_14 : i32
        %44 = "simt_step.if"(%43) ({
          %51 = simt_step.lane_id
          %52 = arith.index_cast %51 : index to i32
          "simt_step.yield"(%52) : (i32) -> ()
        }, {
          %51 = simt_step.lane_id
          %52 = arith.index_cast %51 : index to i32
          "simt_step.yield"(%52) : (i32) -> ()
        }) : (i1) -> i32
        %c448_i32 = arith.constant 448 : i32
        %45 = arith.addi %c448_i32, %0 : i32
        %true_15 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) {fallthrough = true} : (i32) -> ()
      ^bb3(%47: i32):  // no predecessors
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %48:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %51 = arith.muli %arg5, %c4_i32_20 : i32
          %52 = arith.addi %51, %0 : i32
          %c144_i32 = arith.constant 144 : i32
          %53 = arith.addi %c144_i32, %52 : i32
          %54 = "simt_step.buffer.load"(%arg1, %53) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %55 = arith.cmpi ne, %54, %c0_i32_21 : i32
          "simt_step.condition"(%55, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %51 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %52 = arith.addi %arg5, %c1_i32 : i32
          %true_20 = arith.constant true
          %c464_i32 = arith.constant 464 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %53 = arith.muli %arg5, %c4_i32_21 : i32
          %54 = arith.addi %c464_i32, %53 : i32
          %55 = arith.addi %54, %0 : i32
          %true_22 = arith.constant true
          %56 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%51, %52) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_18 = arith.constant true
        %c480_i32 = arith.constant 480 : i32
        %49 = arith.addi %c480_i32, %0 : i32
        %true_19 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%48#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

