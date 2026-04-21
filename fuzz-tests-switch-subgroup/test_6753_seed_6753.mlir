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
        %true = arith.constant true
        %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %c4_i32 = arith.constant 4 : i32
        %5 = arith.muli %arg5, %c4_i32 : i32
        %6 = arith.addi %c0_i32_2, %5 : i32
        %7 = arith.addi %6, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %7, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%4) : (i32) -> ()
      }, {
        %c0_i32_2 = arith.constant 0 : i32
        %4 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %5 = "simt_step.if"(%4) ({
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg5, %c4_i32 : i32
          %8 = arith.addi %c16_i32, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }, {
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg5, %c4_i32 : i32
          %8 = arith.addi %c32_i32, %7 : i32
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
      %21 = "simt_step.switch"(%20, %0) ({
      ^bb0(%arg2: i32):
        %c16_i32 = arith.constant 16 : i32
        %24 = arith.addi %c16_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_4 : i32
        %27 = "simt_step.if"(%26) ({
          %c4_i32_9 = arith.constant 4 : i32
          %35 = arith.addi %0, %c4_i32_9 : i32
          "simt_step.yield"(%35) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c48_i32_5 = arith.constant 48 : i32
        %28 = arith.addi %c48_i32_5, %0 : i32
        %true_6 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_7 = arith.constant true
        %c64_i32 = arith.constant 64 : i32
        %30 = arith.addi %c64_i32, %0 : i32
        %true_8 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %33 = simt_step.lane_id
        %34 = arith.index_cast %33 : index to i32
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      %c80_i32 = arith.constant 80 : i32
      %22 = arith.addi %c80_i32, %0 : i32
      %true_3 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) : (i32) -> ()
    }, {
      %c20_i32 = arith.constant 20 : i32
      %19 = arith.addi %c20_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %21 = simt_step.subgroup_id
      %22 = arith.index_cast %21 : index to i32
      %23 = "simt_step.switch"(%20, %22) ({
      ^bb0(%arg2: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_8 : i32
          %36 = arith.addi %35, %0 : i32
          %c24_i32 = arith.constant 24 : i32
          %37 = arith.addi %c24_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_9 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_9 : i32
          "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %35 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %arg4, %c1_i32 : i32
          %true_8 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %37 = arith.muli %arg4, %c4_i32_9 : i32
          %38 = arith.addi %c96_i32, %37 : i32
          %39 = arith.addi %38, %0 : i32
          %true_10 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %28 = arith.addi %c44_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %30 = simt_step.lane_id
        %31 = arith.index_cast %30 : index to i32
        %32 = "simt_step.switch"(%29, %31) ({
        ^bb0(%arg3: i32):
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %0, %c1_i32 : i32
          %true_8 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %37 = arith.addi %c112_i32, %0 : i32
          %true_9 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = true} : (i32) -> ()
        ^bb2(%39: i32):  // no predecessors
          %c0_i32_10 = arith.constant 0 : i32
          %true_11 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %40 = arith.addi %c128_i32, %0 : i32
          %true_12 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb3(%42: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %33 = arith.addi %c144_i32, %0 : i32
        %true_7 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      %c160_i32 = arith.constant 160 : i32
      %24 = arith.addi %c160_i32, %0 : i32
      %true_3 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%23) : (i32) -> ()
    }) : (i1) -> i32
    %c176_i32 = arith.constant 176 : i32
    %9 = arith.addi %c176_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c48_i32 = arith.constant 48 : i32
    %11 = arith.addi %c48_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %13 = simt_step.subgroup_id
    %14 = arith.index_cast %13 : index to i32
    %15 = "simt_step.switch"(%12, %14) ({
    ^bb0(%arg2: i32):
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32) {fallthrough = true} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %32 = arith.muli %arg4, %c4_i32_10 : i32
        %33 = arith.addi %32, %0 : i32
        %c52_i32 = arith.constant 52 : i32
        %34 = arith.addi %c52_i32, %33 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_11 : i32
        "simt_step.condition"(%36, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %39 = arith.muli %arg6, %c4_i32_15 : i32
          %40 = arith.addi %39, %0 : i32
          %c72_i32 = arith.constant 72 : i32
          %41 = arith.addi %c72_i32, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_16 : i32
          "simt_step.condition"(%43, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %39 = arith.addi %arg5, %arg6 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %40 = arith.addi %arg6, %c1_i32_15 : i32
          %true_16 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %41 = arith.muli %arg6, %c4_i32_17 : i32
          %42 = arith.addi %c192_i32, %41 : i32
          %43 = arith.addi %42, %0 : i32
          %true_18 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %33 = arith.addi %arg3, %32#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %34 = arith.addi %arg4, %c1_i32 : i32
        %true_12 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %c4_i32_13 = arith.constant 4 : i32
        %35 = arith.muli %arg4, %c4_i32_13 : i32
        %36 = arith.addi %c208_i32, %35 : i32
        %37 = arith.addi %36, %0 : i32
        %true_14 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33, %34) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_4 = arith.constant true
      %c224_i32 = arith.constant 224 : i32
      %21 = arith.addi %c224_i32, %0 : i32
      %true_5 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%23: i32):  // no predecessors
      %c92_i32 = arith.constant 92 : i32
      %24 = arith.addi %c92_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_6 : i32
      %27 = "simt_step.if"(%26) ({
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32) : (i32) -> ()
      }, {
        %c96_i32 = arith.constant 96 : i32
        %32 = arith.addi %c96_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32_10 = arith.constant 3 : i32
        %34 = "simt_step.switch"(%33, %c3_i32_10) ({
        ^bb0(%arg3: i32):
          %37 = simt_step.lane_id
          %38 = arith.index_cast %37 : index to i32
          %true_13 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %39 = arith.addi %c240_i32, %0 : i32
          %true_14 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          %42 = simt_step.subgroup_id
          %43 = arith.index_cast %42 : index to i32
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        ^bb2(%44: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb3(%45: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %35 = arith.addi %c256_i32, %0 : i32
        %true_12 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34) : (i32) -> ()
      }) : (i1) -> i32
      %c272_i32 = arith.constant 272 : i32
      %28 = arith.addi %c272_i32, %0 : i32
      %true_7 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_8 = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %30 = arith.addi %c288_i32, %0 : i32
      %true_9 = arith.constant true
      %31 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %c100_i32 = arith.constant 100 : i32
    %16 = arith.addi %c100_i32, %0 : i32
    %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %18 = "simt_step.switch"(%17, %c0_i32_1) ({
    ^bb0(%arg2: i32):
      %c104_i32 = arith.constant 104 : i32
      %19 = arith.addi %c104_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_2 : i32
      %22 = "simt_step.if"(%21) ({
        "simt_step.yield"(%0) : (i32) -> ()
      }, {
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32) : (i32) -> ()
      }) : (i1) -> i32
      %c304_i32 = arith.constant 304 : i32
      %23 = arith.addi %c304_i32, %0 : i32
      %true_3 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_4 = arith.constant true
      %c320_i32 = arith.constant 320 : i32
      %25 = arith.addi %c320_i32, %0 : i32
      %true_5 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
    ^bb1(%27: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %28:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %45 = arith.muli %arg4, %c4_i32_14 : i32
        %46 = arith.addi %45, %0 : i32
        %c108_i32 = arith.constant 108 : i32
        %47 = arith.addi %c108_i32, %46 : i32
        %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %49 = arith.cmpi ne, %48, %c0_i32_15 : i32
        "simt_step.condition"(%49, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %45 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %46 = arith.addi %arg4, %c1_i32 : i32
        %true_14 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %c4_i32_15 = arith.constant 4 : i32
        %47 = arith.muli %arg4, %c4_i32_15 : i32
        %48 = arith.addi %c336_i32, %47 : i32
        %49 = arith.addi %48, %0 : i32
        %true_16 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45, %46) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      %c352_i32 = arith.constant 352 : i32
      %29 = arith.addi %c352_i32, %0 : i32
      %true_9 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%28#0) {fallthrough = true} : (i32) -> ()
    ^bb2(%31: i32):  // no predecessors
      %c128_i32 = arith.constant 128 : i32
      %32 = arith.addi %c128_i32, %0 : i32
      %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %34 = arith.cmpi ne, %33, %c0_i32_10 : i32
      %35 = "simt_step.if"(%34) ({
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %45:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %46 = arith.muli %arg4, %c4_i32_16 : i32
          %47 = arith.addi %46, %0 : i32
          %c132_i32 = arith.constant 132 : i32
          %48 = arith.addi %c132_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_17 : i32
          "simt_step.condition"(%50, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %46 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %arg4, %c1_i32 : i32
          %true_16 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %48 = arith.muli %arg4, %c4_i32_17 : i32
          %49 = arith.addi %c368_i32, %48 : i32
          %50 = arith.addi %49, %0 : i32
          %true_18 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%45#0) : (i32) -> ()
      }, {
        %c152_i32 = arith.constant 152 : i32
        %45 = arith.addi %c152_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %47 = simt_step.subgroup_id
        %48 = arith.index_cast %47 : index to i32
        %49 = "simt_step.switch"(%46, %48) ({
        ^bb0(%arg3: i32):
          %c1_i32 = arith.constant 1 : i32
          %52 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        ^bb1(%53: i32):  // no predecessors
          %true_16 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %54 = arith.addi %c384_i32, %0 : i32
          %true_17 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %50 = arith.addi %c400_i32, %0 : i32
        %true_15 = arith.constant true
        %51 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%49) : (i32) -> ()
      }) : (i1) -> i32
      %c416_i32 = arith.constant 416 : i32
      %36 = arith.addi %c416_i32, %0 : i32
      %true_11 = arith.constant true
      %37 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%35) {fallthrough = true} : (i32) -> ()
    ^bb3(%38: i32):  // no predecessors
      %c156_i32 = arith.constant 156 : i32
      %39 = arith.addi %c156_i32, %0 : i32
      %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_12 = arith.constant 0 : i32
      %41 = arith.cmpi ne, %40, %c0_i32_12 : i32
      %42 = "simt_step.if"(%41) ({
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %45:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %46 = arith.muli %arg4, %c4_i32_16 : i32
          %47 = arith.addi %46, %0 : i32
          %c160_i32 = arith.constant 160 : i32
          %48 = arith.addi %c160_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_17 : i32
          "simt_step.condition"(%50, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %46 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %arg4, %c1_i32 : i32
          %true_16 = arith.constant true
          %c432_i32 = arith.constant 432 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %48 = arith.muli %arg4, %c4_i32_17 : i32
          %49 = arith.addi %c432_i32, %48 : i32
          %50 = arith.addi %49, %0 : i32
          %true_18 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%45#0) : (i32) -> ()
      }, {
        %c180_i32 = arith.constant 180 : i32
        %45 = arith.addi %c180_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %47 = arith.cmpi ne, %46, %c0_i32_14 : i32
        %48 = "simt_step.if"(%47) ({
          %51 = simt_step.subgroup_id
          %52 = arith.index_cast %51 : index to i32
          "simt_step.yield"(%52) : (i32) -> ()
        }, {
          %c4_i32_16 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_16) : (i32) -> ()
        }) : (i1) -> i32
        %c448_i32 = arith.constant 448 : i32
        %49 = arith.addi %c448_i32, %0 : i32
        %true_15 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%48) : (i32) -> ()
      }) : (i1) -> i32
      %c464_i32 = arith.constant 464 : i32
      %43 = arith.addi %c464_i32, %0 : i32
      %true_13 = arith.constant true
      %44 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    return
  }
}

