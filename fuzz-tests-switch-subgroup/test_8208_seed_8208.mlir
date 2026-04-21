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
      %5 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %5, %c1_i32 : i32
      %7 = arith.cmpi slt, %arg5, %6 : i32
      "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %5 = arith.remsi %arg3, %c4_i32 : i32
      %c4_i32_3 = arith.constant 4 : i32
      %6 = "simt_step.switch"(%5, %c4_i32_3) ({
      ^bb0(%arg6: i32):
        %true_4 = arith.constant true
        %8 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %c4_i32_5 = arith.constant 4 : i32
        %9 = arith.muli %arg5, %c4_i32_5 : i32
        %10 = arith.addi %c16_i32, %9 : i32
        %11 = arith.addi %10, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
      ^bb1(%12: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %13:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %22 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %23 = arith.addi %22, %c1_i32_12 : i32
          %24 = arith.cmpi slt, %arg8, %23 : i32
          "simt_step.condition"(%24, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_11 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %23 = arith.muli %arg8, %c4_i32_12 : i32
          %24 = arith.addi %c32_i32, %23 : i32
          %25 = arith.addi %24, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_13 = arith.constant 1 : i32
          %26 = arith.addi %arg8, %c1_i32_13 : i32
          "simt_step.yield"(%22, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%13#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%14: i32):  // no predecessors
        %true_8 = arith.constant true
        %15 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %16 = arith.muli %arg5, %c4_i32_9 : i32
        %17 = arith.addi %c48_i32, %16 : i32
        %18 = arith.addi %17, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %18, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
      ^bb3(%19: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %arg2, %c0_i32_10 : i32
        %21 = "simt_step.if"(%20) ({
          %true_11 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %23 = arith.muli %arg5, %c4_i32_12 : i32
          %24 = arith.addi %c64_i32, %23 : i32
          %25 = arith.addi %24, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) : (i32) -> ()
        }, {
          %true_11 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %23 = arith.muli %arg5, %c4_i32_12 : i32
          %24 = arith.addi %c80_i32, %23 : i32
          %25 = arith.addi %24, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %7 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%6, %7) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %0, %2#0 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        %24 = arith.cmpi slt, %arg3, %c1_i32 : i32
        "simt_step.condition"(%24, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %24 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%arg2, %24) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_1 : i32
    %9 = "simt_step.if"(%8) ({
      %23 = simt_step.lane_id
      %24 = arith.index_cast %23 : index to i32
      "simt_step.yield"(%24) : (i32) -> ()
    }, {
      %c12_i32 = arith.constant 12 : i32
      %23 = arith.addi %c12_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %25 = "simt_step.switch"(%24, %0) ({
      ^bb0(%arg2: i32):
        %26 = simt_step.subgroup_id
        %27 = arith.index_cast %26 : index to i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb1(%28: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb2(%29: i32):  // no predecessors
        %c4_i32_4 = arith.constant 4 : i32
        %30 = arith.addi %0, %c4_i32_4 : i32
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      ^bb3(%31: i32):  // no predecessors
        %true_5 = arith.constant true
        %c96_i32 = arith.constant 96 : i32
        %32 = arith.addi %c96_i32, %0 : i32
        %true_6 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%25) : (i32) -> ()
    }) : (i1) -> i32
    %c112_i32 = arith.constant 112 : i32
    %10 = arith.addi %c112_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c16_i32 = arith.constant 16 : i32
    %12 = arith.addi %c16_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %14 = arith.cmpi ne, %13, %c0_i32_2 : i32
    %15 = "simt_step.if"(%14) ({
      %c20_i32 = arith.constant 20 : i32
      %23 = arith.addi %c20_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %25 = simt_step.subgroup_id
      %26 = arith.index_cast %25 : index to i32
      %27 = "simt_step.switch"(%24, %26) ({
      ^bb0(%arg2: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %43 = arith.muli %arg4, %c4_i32_14 : i32
          %44 = arith.addi %43, %0 : i32
          %c24_i32 = arith.constant 24 : i32
          %45 = arith.addi %c24_i32, %44 : i32
          %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %47 = arith.cmpi ne, %46, %c0_i32_15 : i32
          "simt_step.condition"(%47, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %43 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %44 = arith.addi %arg4, %c1_i32 : i32
          %true_14 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %45 = arith.muli %arg4, %c4_i32_15 : i32
          %46 = arith.addi %c128_i32, %45 : i32
          %47 = arith.addi %46, %0 : i32
          %true_16 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43, %44) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%29: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %30 = arith.addi %c44_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %32 = simt_step.subgroup_id
        %33 = arith.index_cast %32 : index to i32
        %34 = "simt_step.switch"(%31, %33) ({
        ^bb0(%arg3: i32):
          %c1_i32 = arith.constant 1 : i32
          %43 = arith.addi %0, %c1_i32 : i32
          %true_14 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %44 = arith.addi %c144_i32, %0 : i32
          %true_15 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          %47 = simt_step.lane_id
          %48 = arith.index_cast %47 : index to i32
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %35 = arith.addi %c160_i32, %0 : i32
        %true_7 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_8 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %37 = arith.addi %c176_i32, %0 : i32
        %true_9 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      ^bb2(%39: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %40:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %43 = arith.muli %arg4, %c4_i32_14 : i32
          %44 = arith.addi %43, %0 : i32
          %c48_i32 = arith.constant 48 : i32
          %45 = arith.addi %c48_i32, %44 : i32
          %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %47 = arith.cmpi ne, %46, %c0_i32_15 : i32
          "simt_step.condition"(%47, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %43 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %44 = arith.addi %arg4, %c1_i32 : i32
          %true_14 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %45 = arith.muli %arg4, %c4_i32_15 : i32
          %46 = arith.addi %c192_i32, %45 : i32
          %47 = arith.addi %46, %0 : i32
          %true_16 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43, %44) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %41 = arith.addi %c208_i32, %0 : i32
        %true_13 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%27) : (i32) -> ()
    }, {
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %24 = arith.muli %arg3, %c4_i32_6 : i32
        %25 = arith.addi %24, %0 : i32
        %c68_i32 = arith.constant 68 : i32
        %26 = arith.addi %c68_i32, %25 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_7 : i32
        "simt_step.condition"(%28, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c88_i32 = arith.constant 88 : i32
        %24 = arith.addi %c88_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %26 = "simt_step.switch"(%25, %c0_i32_6) ({
        ^bb0(%arg4: i32):
          %35 = simt_step.subgroup_id
          %36 = arith.index_cast %35 : index to i32
          %true_12 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %37 = arith.addi %c224_i32, %0 : i32
          %true_13 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = true} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %40 = simt_step.subgroup_id
          %41 = arith.index_cast %40 : index to i32
          %true_14 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %42 = arith.addi %c240_i32, %0 : i32
          %true_15 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb2(%44: i32):  // no predecessors
          %45 = simt_step.lane_id
          %46 = arith.index_cast %45 : index to i32
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %27 = arith.addi %c256_i32, %0 : i32
        %true_8 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %29 = arith.addi %arg2, %26 : i32
        %c1_i32 = arith.constant 1 : i32
        %30 = arith.addi %arg3, %c1_i32 : i32
        %true_9 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %c4_i32_10 = arith.constant 4 : i32
        %31 = arith.muli %arg3, %c4_i32_10 : i32
        %32 = arith.addi %c272_i32, %31 : i32
        %33 = arith.addi %32, %0 : i32
        %true_11 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29, %30) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%23#0) : (i32) -> ()
    }) : (i1) -> i32
    %c288_i32 = arith.constant 288 : i32
    %16 = arith.addi %c288_i32, %0 : i32
    %true_3 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c92_i32 = arith.constant 92 : i32
    %18 = arith.addi %c92_i32, %0 : i32
    %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
    %20 = simt_step.subgroup_id
    %21 = arith.index_cast %20 : index to i32
    %22 = "simt_step.switch"(%19, %21) ({
    ^bb0(%arg2: i32):
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_9 : i32
        %31 = arith.addi %30, %0 : i32
        %c96_i32 = arith.constant 96 : i32
        %32 = arith.addi %c96_i32, %31 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_10 : i32
        "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c116_i32 = arith.constant 116 : i32
        %30 = arith.addi %c116_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %32 = simt_step.lane_id
        %33 = arith.index_cast %32 : index to i32
        %34 = "simt_step.switch"(%31, %33) ({
        ^bb0(%arg5: i32):
          %c2_i32 = arith.constant 2 : i32
          %41 = arith.addi %0, %c2_i32 : i32
          %true_12 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %42 = arith.addi %c304_i32, %0 : i32
          %true_13 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          %c4_i32_14 = arith.constant 4 : i32
          %45 = arith.addi %0, %c4_i32_14 : i32
          %true_15 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %46 = arith.addi %c320_i32, %0 : i32
          %true_16 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        ^bb2(%48: i32):  // no predecessors
          %49 = simt_step.lane_id
          %50 = arith.index_cast %49 : index to i32
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %35 = arith.addi %arg3, %34 : i32
        %c1_i32 = arith.constant 1 : i32
        %36 = arith.addi %arg4, %c1_i32 : i32
        %true_9 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %c4_i32_10 = arith.constant 4 : i32
        %37 = arith.muli %arg4, %c4_i32_10 : i32
        %38 = arith.addi %c336_i32, %37 : i32
        %39 = arith.addi %38, %0 : i32
        %true_11 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35, %36) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%24: i32):  // no predecessors
      %c120_i32 = arith.constant 120 : i32
      %25 = arith.addi %c120_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %27 = "simt_step.switch"(%26, %c0_i32_6) ({
      ^bb0(%arg3: i32):
        %true_9 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %30 = arith.addi %c352_i32, %0 : i32
        %true_10 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %true_11 = arith.constant true
        %c368_i32 = arith.constant 368 : i32
        %33 = arith.addi %c368_i32, %0 : i32
        %true_12 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c3_i32) {fallthrough = true} : (i32) -> ()
      ^bb2(%35: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %36:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %45 = arith.muli %arg5, %c4_i32_17 : i32
          %46 = arith.addi %45, %0 : i32
          %c124_i32 = arith.constant 124 : i32
          %47 = arith.addi %c124_i32, %46 : i32
          %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %49 = arith.cmpi ne, %48, %c0_i32_18 : i32
          "simt_step.condition"(%49, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %45 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %46 = arith.addi %arg5, %c1_i32 : i32
          %true_17 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %47 = arith.muli %arg5, %c4_i32_18 : i32
          %48 = arith.addi %c384_i32, %47 : i32
          %49 = arith.addi %48, %0 : i32
          %true_19 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45, %46) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%36#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%37: i32):  // no predecessors
        %c144_i32 = arith.constant 144 : i32
        %38 = arith.addi %c144_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %40 = simt_step.lane_id
        %41 = arith.index_cast %40 : index to i32
        %42 = "simt_step.switch"(%39, %41) ({
        ^bb0(%arg4: i32):
          %c1_i32 = arith.constant 1 : i32
          %true_17 = arith.constant true
          %c400_i32 = arith.constant 400 : i32
          %45 = arith.addi %c400_i32, %0 : i32
          %true_18 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%47: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%48: i32):  // no predecessors
          %true_19 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %49 = arith.addi %c416_i32, %0 : i32
          %true_20 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        %c432_i32 = arith.constant 432 : i32
        %43 = arith.addi %c432_i32, %0 : i32
        %true_16 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      %c448_i32 = arith.constant 448 : i32
      %28 = arith.addi %c448_i32, %0 : i32
      %true_8 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

