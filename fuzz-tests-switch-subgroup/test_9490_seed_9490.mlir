module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %1 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.addi %1, %c1_i32 : i32
      %3 = arith.cmpi slt, %arg5, %2 : i32
      "simt_step.condition"(%3, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c3_i32 = arith.constant 3 : i32
      %1 = arith.remsi %arg3, %c3_i32 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %2 = arith.addi %arg0, %c0_i32_1 : i32
      %3 = "simt_step.switch"(%1, %2) ({
      ^bb0(%arg6: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %5 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %6 = "simt_step.if"(%5) ({
          %true_8 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c0_i32_9 = arith.constant 0 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %21 = arith.muli %arg5, %c4_i32_10 : i32
          %22 = arith.addi %c0_i32_9, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) : (i32) -> ()
        }, {
          %true_8 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %21 = arith.muli %arg5, %c4_i32_9 : i32
          %22 = arith.addi %c16_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
      ^bb1(%7: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %8:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32_8 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32_9 : i32
          %22 = arith.cmpi slt, %arg8, %21 : i32
          "simt_step.condition"(%22, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_8 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %21 = arith.muli %arg8, %c4_i32_9 : i32
          %22 = arith.addi %c32_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_10 = arith.constant 1 : i32
          %24 = arith.addi %arg8, %c1_i32_10 : i32
          "simt_step.yield"(%20, %24) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%8#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%9: i32):  // no predecessors
        %c4_i32 = arith.constant 4 : i32
        %10 = arith.remsi %arg3, %c4_i32 : i32
        %11 = simt_step.lane_id
        %12 = arith.index_cast %11 : index to i32
        %13 = "simt_step.switch"(%10, %12) ({
        ^bb0(%arg7: i32):
          %true_8 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %21 = arith.muli %arg5, %c4_i32_9 : i32
          %22 = arith.addi %c48_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          %true_10 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %26 = arith.muli %arg5, %c4_i32_11 : i32
          %27 = arith.addi %c64_i32, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        ^bb2(%29: i32):  // no predecessors
          %true_12 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %31 = arith.muli %arg5, %c4_i32_13 : i32
          %32 = arith.addi %c80_i32, %31 : i32
          %33 = arith.addi %32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        ^bb3(%34: i32):  // no predecessors
          %true_14 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %36 = arith.muli %arg5, %c4_i32_15 : i32
          %37 = arith.addi %c96_i32, %36 : i32
          %38 = arith.addi %37, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %38, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        %14 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %c4_i32_5 = arith.constant 4 : i32
        %15 = arith.muli %arg5, %c4_i32_5 : i32
        %16 = arith.addi %c112_i32, %15 : i32
        %17 = arith.addi %16, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %17, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      ^bb3(%18: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32_8 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32_9 : i32
          %22 = arith.cmpi slt, %arg8, %21 : i32
          "simt_step.condition"(%22, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_8 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %21 = arith.muli %arg8, %c4_i32_9 : i32
          %22 = arith.addi %c128_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_10 = arith.constant 1 : i32
          %24 = arith.addi %arg8, %c1_i32_10 : i32
          "simt_step.yield"(%20, %24) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %4 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%3, %4) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
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
    %c3_i32 = arith.constant 3 : i32
    %5 = arith.addi %0, %c3_i32 : i32
    %6 = simt_step.lane_id
    %7 = arith.index_cast %6 : index to i32
    %c8_i32 = arith.constant 8 : i32
    %8 = arith.addi %c8_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c3_i32_0 = arith.constant 3 : i32
    %10 = "simt_step.switch"(%9, %c3_i32_0) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %11 = arith.addi %c12_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32_1 = arith.constant 3 : i32
      %13 = arith.addi %0, %c3_i32_1 : i32
      %14 = "simt_step.switch"(%12, %13) ({
      ^bb0(%arg3: i32):
        %c2_i32 = arith.constant 2 : i32
        %37 = arith.addi %0, %c2_i32 : i32
        "simt_step.yield"(%37) {fallthrough = true} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        %c16_i32 = arith.constant 16 : i32
        %39 = arith.addi %c16_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32_9 = arith.constant 2 : i32
        %41 = arith.addi %0, %c2_i32_9 : i32
        %42 = "simt_step.switch"(%40, %41) ({
        ^bb0(%arg4: i32):
          %45 = simt_step.lane_id
          %46 = arith.index_cast %45 : index to i32
          %true_12 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %47 = arith.addi %c144_i32, %0 : i32
          %true_13 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%46) {fallthrough = true} : (i32) -> ()
        ^bb1(%49: i32):  // no predecessors
          %50 = simt_step.subgroup_id
          %51 = arith.index_cast %50 : index to i32
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        ^bb2(%52: i32):  // no predecessors
          %53 = simt_step.subgroup_id
          %54 = arith.index_cast %53 : index to i32
          "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %43 = arith.addi %c160_i32, %0 : i32
        %true_11 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c176_i32 = arith.constant 176 : i32
      %15 = arith.addi %c176_i32, %0 : i32
      %true_2 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14) {fallthrough = true} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c20_i32 = arith.constant 20 : i32
      %18 = arith.addi %c20_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %20 = simt_step.subgroup_id
      %21 = arith.index_cast %20 : index to i32
      %22 = "simt_step.switch"(%19, %21) ({
      ^bb0(%arg3: i32):
        %true_9 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %37 = arith.addi %c192_i32, %0 : i32
        %true_10 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
      ^bb1(%39: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %40:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %45 = arith.muli %arg5, %c4_i32_16 : i32
          %46 = arith.addi %45, %0 : i32
          %c24_i32 = arith.constant 24 : i32
          %47 = arith.addi %c24_i32, %46 : i32
          %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %49 = arith.cmpi ne, %48, %c0_i32_17 : i32
          "simt_step.condition"(%49, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %45 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %46 = arith.addi %arg5, %c1_i32 : i32
          %true_16 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %47 = arith.muli %arg5, %c4_i32_17 : i32
          %48 = arith.addi %c208_i32, %47 : i32
          %49 = arith.addi %48, %0 : i32
          %true_18 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45, %46) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%40#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%41: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %true_14 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %42 = arith.addi %c224_i32, %0 : i32
        %true_15 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c0_i32_13) {fallthrough = true} : (i32) -> ()
      ^bb3(%44: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb2(%23: i32):  // no predecessors
      %24 = simt_step.subgroup_id
      %25 = arith.index_cast %24 : index to i32
      %true_3 = arith.constant true
      %c240_i32 = arith.constant 240 : i32
      %26 = arith.addi %c240_i32, %0 : i32
      %true_4 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb3(%28: i32):  // no predecessors
      %c44_i32 = arith.constant 44 : i32
      %29 = arith.addi %c44_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %31 = arith.cmpi ne, %30, %c0_i32_5 : i32
      %32 = "simt_step.if"(%31) ({
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %38 = arith.muli %arg4, %c4_i32_11 : i32
          %39 = arith.addi %38, %0 : i32
          %c48_i32 = arith.constant 48 : i32
          %40 = arith.addi %c48_i32, %39 : i32
          %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %42 = arith.cmpi ne, %41, %c0_i32_12 : i32
          "simt_step.condition"(%42, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %38 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %39 = arith.addi %arg4, %c1_i32 : i32
          %true_11 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %40 = arith.muli %arg4, %c4_i32_12 : i32
          %41 = arith.addi %c256_i32, %40 : i32
          %42 = arith.addi %41, %0 : i32
          %true_13 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%38, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%37#0) : (i32) -> ()
      }, {
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %38 = arith.muli %arg4, %c4_i32_11 : i32
          %39 = arith.addi %38, %0 : i32
          %c68_i32 = arith.constant 68 : i32
          %40 = arith.addi %c68_i32, %39 : i32
          %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %42 = arith.cmpi ne, %41, %c0_i32_12 : i32
          "simt_step.condition"(%42, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %38 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %39 = arith.addi %arg4, %c1_i32 : i32
          %true_11 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %40 = arith.muli %arg4, %c4_i32_12 : i32
          %41 = arith.addi %c272_i32, %40 : i32
          %42 = arith.addi %41, %0 : i32
          %true_13 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%37#0) : (i32) -> ()
      }) : (i1) -> i32
      %c288_i32 = arith.constant 288 : i32
      %33 = arith.addi %c288_i32, %0 : i32
      %true_6 = arith.constant true
      %34 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_7 = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %35 = arith.addi %c304_i32, %0 : i32
      %true_8 = arith.constant true
      %36 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

