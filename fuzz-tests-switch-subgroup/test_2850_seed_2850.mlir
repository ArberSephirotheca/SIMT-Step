module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c2_i32 = arith.constant 2 : i32
      %2 = arith.remsi %arg3, %c2_i32 : i32
      %3 = simt_step.subgroup_id
      %4 = arith.index_cast %3 : index to i32
      %5 = "simt_step.switch"(%2, %4) ({
      ^bb0(%arg4: i32):
        %c3_i32 = arith.constant 3 : i32
        %6 = arith.remsi %arg3, %c3_i32 : i32
        %7 = "simt_step.switch"(%6, %arg0) ({
        ^bb0(%arg5: i32):
          %true_2 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c0_i32_3 = arith.constant 0 : i32
          %17 = arith.addi %c0_i32_3, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
        ^bb1(%18: i32):  // no predecessors
          %true_4 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %20 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        ^bb2(%21: i32):  // no predecessors
          %true_5 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %23 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %9 = arith.addi %c48_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
      ^bb1(%10: i32):  // no predecessors
        %true_0 = arith.constant true
        %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %12 = arith.addi %c64_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%11) {fallthrough = true} : (i32) -> ()
      ^bb2(%13: i32):  // no predecessors
        %c0_i32_1 = arith.constant 0 : i32
        %14 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %15 = "simt_step.if"(%14) ({
          %true_2 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %17 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) : (i32) -> ()
        }, {
          %true_2 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %17 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%5) : (i32) -> ()
    }, {
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %2:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %3 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %4 = arith.addi %3, %c1_i32 : i32
        %5 = arith.cmpi slt, %arg5, %4 : i32
        "simt_step.condition"(%5, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c1_i32 = arith.constant 1 : i32
        %3 = "simt_step.switch"(%arg3, %c1_i32) ({
        ^bb0(%arg6: i32):
          %true_3 = arith.constant true
          %9 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_4 = arith.constant 4 : i32
          %10 = arith.muli %arg5, %c4_i32_4 : i32
          %11 = arith.addi %c112_i32, %10 : i32
          %12 = arith.addi %11, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
        ^bb1(%13: i32):  // no predecessors
          %true_5 = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_6 = arith.constant 4 : i32
          %15 = arith.muli %arg5, %c4_i32_6 : i32
          %16 = arith.addi %c128_i32, %15 : i32
          %17 = arith.addi %16, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c144_i32 = arith.constant 144 : i32
        %c4_i32 = arith.constant 4 : i32
        %5 = arith.muli %arg5, %c4_i32 : i32
        %6 = arith.addi %c144_i32, %5 : i32
        %7 = arith.addi %6, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %7, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32_2 = arith.constant 1 : i32
        %8 = arith.addi %arg5, %c1_i32_2 : i32
        "simt_step.yield"(%3, %8) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%2#0) : (i32) -> ()
    }) : (i1) -> i32
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
      %c12_i32 = arith.constant 12 : i32
      %17 = arith.addi %c12_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_1 : i32
      %20 = "simt_step.if"(%19) ({
        %c16_i32 = arith.constant 16 : i32
        %30 = arith.addi %c16_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_6 : i32
        %33 = "simt_step.if"(%32) ({
          %c0_i32_8 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_8) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %34 = arith.addi %c160_i32, %0 : i32
        %true_7 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) : (i32) -> ()
      }, {
        %c20_i32 = arith.constant 20 : i32
        %30 = arith.addi %c20_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_6 : i32
        %33 = "simt_step.if"(%32) ({
          %c4_i32_8 = arith.constant 4 : i32
          %36 = arith.addi %0, %c4_i32_8 : i32
          "simt_step.yield"(%36) : (i32) -> ()
        }, {
          %c0_i32_8 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_8) : (i32) -> ()
        }) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %34 = arith.addi %c176_i32, %0 : i32
        %true_7 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) : (i32) -> ()
      }) : (i1) -> i32
      %c192_i32 = arith.constant 192 : i32
      %21 = arith.addi %c192_i32, %0 : i32
      %true_2 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %true_4 = arith.constant true
      %c208_i32 = arith.constant 208 : i32
      %24 = arith.addi %c208_i32, %0 : i32
      %true_5 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%c0_i32_3) {fallthrough = false} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      %c24_i32 = arith.constant 24 : i32
      %27 = arith.addi %c24_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %29 = "simt_step.switch"(%28, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %51 = arith.muli %arg5, %c4_i32_18 : i32
          %52 = arith.addi %51, %0 : i32
          %c28_i32 = arith.constant 28 : i32
          %53 = arith.addi %c28_i32, %52 : i32
          %54 = "simt_step.buffer.load"(%arg1, %53) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %55 = arith.cmpi ne, %54, %c0_i32_19 : i32
          "simt_step.condition"(%55, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %51 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %52 = arith.addi %arg5, %c1_i32 : i32
          %true_18 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %53 = arith.muli %arg5, %c4_i32_19 : i32
          %54 = arith.addi %c224_i32, %53 : i32
          %55 = arith.addi %54, %0 : i32
          %true_20 = arith.constant true
          %56 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%51, %52) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c48_i32 = arith.constant 48 : i32
        %32 = arith.addi %c48_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_8 : i32
        %35 = "simt_step.if"(%34) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %c0_i32_18 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_18) : (i32) -> ()
        }) : (i1) -> i32
        %c240_i32 = arith.constant 240 : i32
        %36 = arith.addi %c240_i32, %0 : i32
        %true_9 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      ^bb2(%38: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %51 = arith.muli %arg5, %c4_i32_18 : i32
          %52 = arith.addi %51, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %53 = arith.addi %c52_i32, %52 : i32
          %54 = "simt_step.buffer.load"(%arg1, %53) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %55 = arith.cmpi ne, %54, %c0_i32_19 : i32
          "simt_step.condition"(%55, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %51 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %52 = arith.addi %arg5, %c1_i32 : i32
          %true_18 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %53 = arith.muli %arg5, %c4_i32_19 : i32
          %54 = arith.addi %c256_i32, %53 : i32
          %55 = arith.addi %54, %0 : i32
          %true_20 = arith.constant true
          %56 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%51, %52) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %40 = arith.addi %c272_i32, %0 : i32
        %true_13 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%42: i32):  // no predecessors
        %c72_i32 = arith.constant 72 : i32
        %43 = arith.addi %c72_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %45 = arith.cmpi ne, %44, %c0_i32_14 : i32
        %46 = "simt_step.if"(%45) ({
          %51 = simt_step.subgroup_id
          %52 = arith.index_cast %51 : index to i32
          "simt_step.yield"(%52) : (i32) -> ()
        }, {
          %51 = simt_step.subgroup_id
          %52 = arith.index_cast %51 : index to i32
          "simt_step.yield"(%52) : (i32) -> ()
        }) : (i1) -> i32
        %c288_i32 = arith.constant 288 : i32
        %47 = arith.addi %c288_i32, %0 : i32
        %true_15 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_16 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %49 = arith.addi %c304_i32, %0 : i32
        %true_17 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c320_i32 = arith.constant 320 : i32
    %10 = arith.addi %c320_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c76_i32 = arith.constant 76 : i32
    %12 = arith.addi %c76_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = simt_step.subgroup_id
    %15 = arith.index_cast %14 : index to i32
    %16 = "simt_step.switch"(%13, %15) ({
    ^bb0(%arg2: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %17:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %40 = arith.muli %arg4, %c4_i32_9 : i32
        %41 = arith.addi %40, %0 : i32
        %c80_i32 = arith.constant 80 : i32
        %42 = arith.addi %c80_i32, %41 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %44 = arith.cmpi ne, %43, %c0_i32_10 : i32
        "simt_step.condition"(%44, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c100_i32 = arith.constant 100 : i32
        %40 = arith.addi %c100_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %42 = simt_step.lane_id
        %43 = arith.index_cast %42 : index to i32
        %44 = "simt_step.switch"(%41, %43) ({
        ^bb0(%arg5: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %true_13 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %51 = arith.addi %c336_i32, %0 : i32
          %true_14 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_12) {fallthrough = true} : (i32) -> ()
        ^bb1(%53: i32):  // no predecessors
          %54 = simt_step.lane_id
          %55 = arith.index_cast %54 : index to i32
          %true_15 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %56 = arith.addi %c352_i32, %0 : i32
          %true_16 = arith.constant true
          %57 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%55) {fallthrough = true} : (i32) -> ()
        ^bb2(%58: i32):  // no predecessors
          %59 = simt_step.subgroup_id
          %60 = arith.index_cast %59 : index to i32
          %true_17 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %61 = arith.addi %c368_i32, %0 : i32
          %true_18 = arith.constant true
          %62 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%60) {fallthrough = true} : (i32) -> ()
        ^bb3(%63: i32):  // no predecessors
          %64 = simt_step.subgroup_id
          %65 = arith.index_cast %64 : index to i32
          "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %45 = arith.addi %arg3, %44 : i32
        %c1_i32 = arith.constant 1 : i32
        %46 = arith.addi %arg4, %c1_i32 : i32
        %true_9 = arith.constant true
        %c384_i32 = arith.constant 384 : i32
        %c4_i32_10 = arith.constant 4 : i32
        %47 = arith.muli %arg4, %c4_i32_10 : i32
        %48 = arith.addi %c384_i32, %47 : i32
        %49 = arith.addi %48, %0 : i32
        %true_11 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45, %46) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%17#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c104_i32 = arith.constant 104 : i32
      %19 = arith.addi %c104_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_3 : i32
      %22 = "simt_step.if"(%21) ({
        %c108_i32 = arith.constant 108 : i32
        %40 = arith.addi %c108_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %42 = simt_step.lane_id
        %43 = arith.index_cast %42 : index to i32
        %44 = "simt_step.switch"(%41, %43) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%47: i32):  // no predecessors
          %true_11 = arith.constant true
          %c400_i32 = arith.constant 400 : i32
          %48 = arith.addi %c400_i32, %0 : i32
          %true_12 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        %c416_i32 = arith.constant 416 : i32
        %45 = arith.addi %c416_i32, %0 : i32
        %true_10 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) : (i32) -> ()
      }, {
        %c112_i32 = arith.constant 112 : i32
        %40 = arith.addi %c112_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %42 = "simt_step.switch"(%41, %c2_i32) ({
        ^bb0(%arg3: i32):
          %true_9 = arith.constant true
          %c432_i32 = arith.constant 432 : i32
          %43 = arith.addi %c432_i32, %0 : i32
          %true_10 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%45: i32):  // no predecessors
          %c4_i32_11 = arith.constant 4 : i32
          %46 = arith.addi %0, %c4_i32_11 : i32
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        ^bb2(%47: i32):  // no predecessors
          %48 = simt_step.lane_id
          %49 = arith.index_cast %48 : index to i32
          %true_12 = arith.constant true
          %c448_i32 = arith.constant 448 : i32
          %50 = arith.addi %c448_i32, %0 : i32
          %true_13 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%42) : (i32) -> ()
      }) : (i1) -> i32
      %c464_i32 = arith.constant 464 : i32
      %23 = arith.addi %c464_i32, %0 : i32
      %true_4 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c116_i32 = arith.constant 116 : i32
      %26 = arith.addi %c116_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %28 = simt_step.lane_id
      %29 = arith.index_cast %28 : index to i32
      %30 = "simt_step.switch"(%27, %29) ({
      ^bb0(%arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        %40 = arith.addi %0, %c1_i32 : i32
        %true_9 = arith.constant true
        %c480_i32 = arith.constant 480 : i32
        %41 = arith.addi %c480_i32, %0 : i32
        %true_10 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      ^bb1(%43: i32):  // no predecessors
        %c120_i32 = arith.constant 120 : i32
        %44 = arith.addi %c120_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %46 = arith.cmpi ne, %45, %c0_i32_11 : i32
        %47 = "simt_step.if"(%46) ({
          %53 = simt_step.lane_id
          %54 = arith.index_cast %53 : index to i32
          "simt_step.yield"(%54) : (i32) -> ()
        }, {
          %53 = simt_step.lane_id
          %54 = arith.index_cast %53 : index to i32
          "simt_step.yield"(%54) : (i32) -> ()
        }) : (i1) -> i32
        %c496_i32 = arith.constant 496 : i32
        %48 = arith.addi %c496_i32, %0 : i32
        %true_12 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
      ^bb2(%50: i32):  // no predecessors
        %51 = simt_step.subgroup_id
        %52 = arith.index_cast %51 : index to i32
        "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      %c512_i32 = arith.constant 512 : i32
      %31 = arith.addi %c512_i32, %0 : i32
      %true_6 = arith.constant true
      %32 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
    ^bb3(%33: i32):  // no predecessors
      %c124_i32 = arith.constant 124 : i32
      %34 = arith.addi %c124_i32, %0 : i32
      %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %36 = arith.cmpi ne, %35, %c0_i32_7 : i32
      %37 = "simt_step.if"(%36) ({
        %c4_i32_9 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_9) : (i32) -> ()
      }, {
        %c128_i32 = arith.constant 128 : i32
        %40 = arith.addi %c128_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %42 = "simt_step.switch"(%41, %0) ({
        ^bb0(%arg3: i32):
          %c3_i32 = arith.constant 3 : i32
          %43 = arith.addi %0, %c3_i32 : i32
          %true_9 = arith.constant true
          %c528_i32 = arith.constant 528 : i32
          %44 = arith.addi %c528_i32, %0 : i32
          %true_10 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          %47 = simt_step.subgroup_id
          %48 = arith.index_cast %47 : index to i32
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%42) : (i32) -> ()
      }) : (i1) -> i32
      %c544_i32 = arith.constant 544 : i32
      %38 = arith.addi %c544_i32, %0 : i32
      %true_8 = arith.constant true
      %39 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

