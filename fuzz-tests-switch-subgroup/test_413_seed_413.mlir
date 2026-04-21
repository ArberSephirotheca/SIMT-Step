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
      %c0_i32_1 = arith.constant 0 : i32
      %1 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %2 = "simt_step.if"(%1) ({
        %c0_i32_2 = arith.constant 0 : i32
        %4 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %5 = "simt_step.if"(%4) ({
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_3 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg5, %c4_i32 : i32
          %8 = arith.addi %c0_i32_3, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }, {
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg5, %c4_i32 : i32
          %8 = arith.addi %c16_i32, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%5) : (i32) -> ()
      }, {
        %c0_i32_2 = arith.constant 0 : i32
        %4 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %5 = "simt_step.if"(%4) ({
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg5, %c4_i32 : i32
          %8 = arith.addi %c32_i32, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }, {
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg5, %c4_i32 : i32
          %8 = arith.addi %c48_i32, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%5) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      %3 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%2, %3) : (i32, i32) -> ()
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
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %c12_i32 = arith.constant 12 : i32
      %19 = arith.addi %c12_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_1 = arith.constant 4 : i32
      %21 = arith.addi %0, %c4_i32_1 : i32
      %22 = "simt_step.switch"(%20, %21) ({
      ^bb0(%arg2: i32):
        %c16_i32 = arith.constant 16 : i32
        %23 = arith.addi %c16_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %25 = simt_step.lane_id
        %26 = arith.index_cast %25 : index to i32
        %27 = "simt_step.switch"(%24, %26) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          %43 = simt_step.subgroup_id
          %44 = arith.index_cast %43 : index to i32
          %true_11 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %45 = arith.addi %c64_i32, %0 : i32
          %true_12 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        ^bb2(%47: i32):  // no predecessors
          %48 = simt_step.subgroup_id
          %49 = arith.index_cast %48 : index to i32
          %true_13 = arith.constant true
          %c80_i32 = arith.constant 80 : i32
          %50 = arith.addi %c80_i32, %0 : i32
          %true_14 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_2 = arith.constant true
        %c96_i32 = arith.constant 96 : i32
        %28 = arith.addi %c96_i32, %0 : i32
        %true_3 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %42 = arith.muli %arg4, %c4_i32_11 : i32
          %43 = arith.addi %42, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %44 = arith.addi %c20_i32, %43 : i32
          %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %46 = arith.cmpi ne, %45, %c0_i32_12 : i32
          "simt_step.condition"(%46, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %42 = arith.addi %arg3, %arg4 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %43 = arith.addi %arg4, %c1_i32_11 : i32
          %true_12 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %44 = arith.muli %arg4, %c4_i32_13 : i32
          %45 = arith.addi %c112_i32, %44 : i32
          %46 = arith.addi %45, %0 : i32
          %true_14 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%42, %43) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%31#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%32: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %33 = arith.addi %c40_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_6 : i32
        %36 = "simt_step.if"(%35) ({
          %c4_i32_11 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_11) : (i32) -> ()
        }, {
          %c4_i32_11 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_11) : (i32) -> ()
        }) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %37 = arith.addi %c128_i32, %0 : i32
        %true_7 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb3(%39: i32):  // no predecessors
        %c1_i32_8 = arith.constant 1 : i32
        %true_9 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %40 = arith.addi %c144_i32, %0 : i32
        %true_10 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c1_i32_8) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%22) : (i32) -> ()
    }, {
      %c44_i32 = arith.constant 44 : i32
      %19 = arith.addi %c44_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_1 : i32
      %22 = "simt_step.if"(%21) ({
        %c48_i32 = arith.constant 48 : i32
        %25 = arith.addi %c48_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %27 = "simt_step.switch"(%26, %c3_i32) ({
        ^bb0(%arg2: i32):
          %c1_i32_5 = arith.constant 1 : i32
          %true_6 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %30 = arith.addi %c160_i32, %0 : i32
          %true_7 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32_5) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %c3_i32_8 = arith.constant 3 : i32
          %33 = arith.addi %0, %c3_i32_8 : i32
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb2(%34: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%35: i32):  // no predecessors
          %c1_i32_9 = arith.constant 1 : i32
          %true_10 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %36 = arith.addi %c176_i32, %0 : i32
          %true_11 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32_9) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_3 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %28 = arith.addi %c192_i32, %0 : i32
        %true_4 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27) : (i32) -> ()
      }, {
        %c52_i32 = arith.constant 52 : i32
        %25 = arith.addi %c52_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_3 : i32
        %28 = "simt_step.if"(%27) ({
          %c0_i32_5 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_5) : (i32) -> ()
        }, {
          %31 = simt_step.lane_id
          %32 = arith.index_cast %31 : index to i32
          "simt_step.yield"(%32) : (i32) -> ()
        }) : (i1) -> i32
        %c208_i32 = arith.constant 208 : i32
        %29 = arith.addi %c208_i32, %0 : i32
        %true_4 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) : (i32) -> ()
      }) : (i1) -> i32
      %c224_i32 = arith.constant 224 : i32
      %23 = arith.addi %c224_i32, %0 : i32
      %true_2 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) : (i32) -> ()
    }) : (i1) -> i32
    %c240_i32 = arith.constant 240 : i32
    %9 = arith.addi %c240_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c56_i32 = arith.constant 56 : i32
    %11 = arith.addi %c56_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %13 = "simt_step.switch"(%12, %c1_i32) ({
    ^bb0(%arg2: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %19:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %33 = arith.muli %arg4, %c4_i32_7 : i32
        %34 = arith.addi %33, %0 : i32
        %c60_i32 = arith.constant 60 : i32
        %35 = arith.addi %c60_i32, %34 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_8 : i32
        "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %33 = arith.addi %arg3, %arg4 : i32
        %c1_i32_7 = arith.constant 1 : i32
        %34 = arith.addi %arg4, %c1_i32_7 : i32
        %true_8 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %35 = arith.muli %arg4, %c4_i32_9 : i32
        %36 = arith.addi %c256_i32, %35 : i32
        %37 = arith.addi %36, %0 : i32
        %true_10 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%33, %34) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%20: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %21:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %33 = arith.muli %arg4, %c4_i32_7 : i32
        %34 = arith.addi %33, %0 : i32
        %c80_i32 = arith.constant 80 : i32
        %35 = arith.addi %c80_i32, %34 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_8 : i32
        "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c100_i32 = arith.constant 100 : i32
        %33 = arith.addi %c100_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_7 : i32
        %36 = "simt_step.if"(%35) ({
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) : (i32) -> ()
        }, {
          %c0_i32_13 = arith.constant 0 : i32
          %45 = arith.addi %0, %c0_i32_13 : i32
          "simt_step.yield"(%45) : (i32) -> ()
        }) : (i1) -> i32
        %c272_i32 = arith.constant 272 : i32
        %37 = arith.addi %c272_i32, %0 : i32
        %true_8 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %39 = arith.addi %arg3, %36 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %40 = arith.addi %arg4, %c1_i32_9 : i32
        %true_10 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %c4_i32_11 = arith.constant 4 : i32
        %41 = arith.muli %arg4, %c4_i32_11 : i32
        %42 = arith.addi %c288_i32, %41 : i32
        %43 = arith.addi %42, %0 : i32
        %true_12 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%39, %40) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c104_i32 = arith.constant 104 : i32
      %23 = arith.addi %c104_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %25 = simt_step.subgroup_id
      %26 = arith.index_cast %25 : index to i32
      %27 = "simt_step.switch"(%24, %26) ({
      ^bb0(%arg3: i32):
        %c108_i32 = arith.constant 108 : i32
        %33 = arith.addi %c108_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_7 : i32
        %36 = "simt_step.if"(%35) ({
          %c3_i32 = arith.constant 3 : i32
          %52 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%52) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c304_i32 = arith.constant 304 : i32
        %37 = arith.addi %c304_i32, %0 : i32
        %true_8 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_9 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %39 = arith.addi %c320_i32, %0 : i32
        %true_10 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) {fallthrough = true} : (i32) -> ()
      ^bb1(%41: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %42:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %52 = arith.muli %arg5, %c4_i32_17 : i32
          %53 = arith.addi %52, %0 : i32
          %c112_i32 = arith.constant 112 : i32
          %54 = arith.addi %c112_i32, %53 : i32
          %55 = "simt_step.buffer.load"(%arg1, %54) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %56 = arith.cmpi ne, %55, %c0_i32_18 : i32
          "simt_step.condition"(%56, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %52 = arith.addi %arg4, %arg5 : i32
          %c1_i32_17 = arith.constant 1 : i32
          %53 = arith.addi %arg5, %c1_i32_17 : i32
          %true_18 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %54 = arith.muli %arg5, %c4_i32_19 : i32
          %55 = arith.addi %c336_i32, %54 : i32
          %56 = arith.addi %55, %0 : i32
          %true_20 = arith.constant true
          %57 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%52, %53) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %43 = arith.addi %c352_i32, %0 : i32
        %true_14 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%45: i32):  // no predecessors
        %c132_i32 = arith.constant 132 : i32
        %46 = arith.addi %c132_i32, %0 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %48 = arith.cmpi ne, %47, %c0_i32_15 : i32
        %49 = "simt_step.if"(%48) ({
          %c0_i32_17 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_17) : (i32) -> ()
        }, {
          %c4_i32_17 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_17) : (i32) -> ()
        }) : (i1) -> i32
        %c368_i32 = arith.constant 368 : i32
        %50 = arith.addi %c368_i32, %0 : i32
        %true_16 = arith.constant true
        %51 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb3(%28: i32):  // no predecessors
      %29 = simt_step.lane_id
      %30 = arith.index_cast %29 : index to i32
      %true_5 = arith.constant true
      %c384_i32 = arith.constant 384 : i32
      %31 = arith.addi %c384_i32, %0 : i32
      %true_6 = arith.constant true
      %32 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %c136_i32 = arith.constant 136 : i32
    %14 = arith.addi %c136_i32, %0 : i32
    %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
    %16 = simt_step.subgroup_id
    %17 = arith.index_cast %16 : index to i32
    %18 = "simt_step.switch"(%15, %17) ({
    ^bb0(%arg2: i32):
      %19 = simt_step.lane_id
      %20 = arith.index_cast %19 : index to i32
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %22:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %27 = arith.muli %arg4, %c4_i32_7 : i32
        %28 = arith.addi %27, %0 : i32
        %c140_i32 = arith.constant 140 : i32
        %29 = arith.addi %c140_i32, %28 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_8 : i32
        "simt_step.condition"(%31, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c160_i32 = arith.constant 160 : i32
        %27 = arith.addi %c160_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_7 : i32
        %30 = "simt_step.if"(%29) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c400_i32 = arith.constant 400 : i32
        %31 = arith.addi %c400_i32, %0 : i32
        %true_8 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %33 = arith.addi %arg3, %30 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %34 = arith.addi %arg4, %c1_i32_9 : i32
        %true_10 = arith.constant true
        %c416_i32 = arith.constant 416 : i32
        %c4_i32_11 = arith.constant 4 : i32
        %35 = arith.muli %arg4, %c4_i32_11 : i32
        %36 = arith.addi %c416_i32, %35 : i32
        %37 = arith.addi %36, %0 : i32
        %true_12 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33, %34) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_3 = arith.constant true
      %c432_i32 = arith.constant 432 : i32
      %23 = arith.addi %c432_i32, %0 : i32
      %true_4 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22#0) {fallthrough = true} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %26:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %27 = arith.muli %arg4, %c4_i32_7 : i32
        %28 = arith.addi %27, %0 : i32
        %c164_i32 = arith.constant 164 : i32
        %29 = arith.addi %c164_i32, %28 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_8 : i32
        "simt_step.condition"(%31, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %27 = arith.addi %arg3, %arg4 : i32
        %c1_i32_7 = arith.constant 1 : i32
        %28 = arith.addi %arg4, %c1_i32_7 : i32
        %true_8 = arith.constant true
        %c448_i32 = arith.constant 448 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %29 = arith.muli %arg4, %c4_i32_9 : i32
        %30 = arith.addi %c448_i32, %29 : i32
        %31 = arith.addi %30, %0 : i32
        %true_10 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27, %28) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

