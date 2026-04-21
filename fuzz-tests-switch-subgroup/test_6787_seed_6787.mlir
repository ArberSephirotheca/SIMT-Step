module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %c0_i32 = arith.constant 0 : i32
    %1 = "simt_step.switch"(%0, %c0_i32) ({
    ^bb0(%arg4: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %5:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %9 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %10 = arith.addi %9, %c1_i32 : i32
        %11 = arith.cmpi slt, %arg6, %10 : i32
        "simt_step.condition"(%11, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %true_5 = arith.constant true
        %9 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %c4_i32 = arith.constant 4 : i32
        %10 = arith.muli %arg6, %c4_i32 : i32
        %11 = arith.addi %c0_i32_6, %10 : i32
        %12 = arith.addi %11, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %13 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%9, %13) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%5#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %true = arith.constant true
      %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %8 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %8, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
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
      %c2_i32_3 = arith.constant 2 : i32
      %6 = arith.addi %arg0, %c2_i32_3 : i32
      %7 = "simt_step.switch"(%5, %6) ({
      ^bb0(%arg6: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %13 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %14 = "simt_step.if"(%13) ({
          %true_12 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %31 = arith.muli %arg5, %c4_i32_13 : i32
          %32 = arith.addi %c32_i32, %31 : i32
          %33 = arith.addi %32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) : (i32) -> ()
        }, {
          %true_12 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %31 = arith.muli %arg5, %c4_i32_13 : i32
          %32 = arith.addi %c48_i32, %31 : i32
          %33 = arith.addi %32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%14) {fallthrough = true} : (i32) -> ()
      ^bb1(%15: i32):  // no predecessors
        %c4_i32_6 = arith.constant 4 : i32
        %16 = arith.remsi %arg3, %c4_i32_6 : i32
        %17 = simt_step.lane_id
        %18 = arith.index_cast %17 : index to i32
        %19 = "simt_step.switch"(%16, %18) ({
        ^bb0(%arg7: i32):
          %true_12 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %31 = arith.muli %arg5, %c4_i32_13 : i32
          %32 = arith.addi %c64_i32, %31 : i32
          %33 = arith.addi %32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %true_14 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %36 = arith.muli %arg5, %c4_i32_15 : i32
          %37 = arith.addi %c80_i32, %36 : i32
          %38 = arith.addi %37, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %38, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        ^bb2(%39: i32):  // no predecessors
          %true_16 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %41 = arith.muli %arg5, %c4_i32_17 : i32
          %42 = arith.addi %c96_i32, %41 : i32
          %43 = arith.addi %42, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %43, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        ^bb3(%44: i32):  // no predecessors
          %true_18 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_19 : i32
          %47 = arith.addi %c112_i32, %46 : i32
          %48 = arith.addi %47, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %48, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%19) {fallthrough = true} : (i32) -> ()
      ^bb2(%20: i32):  // no predecessors
        %c4_i32_7 = arith.constant 4 : i32
        %21 = arith.remsi %arg3, %c4_i32_7 : i32
        %c3_i32 = arith.constant 3 : i32
        %22 = arith.addi %arg0, %c3_i32 : i32
        %23 = "simt_step.switch"(%21, %22) ({
        ^bb0(%arg7: i32):
          %true_12 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %31 = arith.muli %arg5, %c4_i32_13 : i32
          %32 = arith.addi %c128_i32, %31 : i32
          %33 = arith.addi %32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %true_14 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %36 = arith.muli %arg5, %c4_i32_15 : i32
          %37 = arith.addi %c144_i32, %36 : i32
          %38 = arith.addi %37, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %38, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        ^bb2(%39: i32):  // no predecessors
          %true_16 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %41 = arith.muli %arg5, %c4_i32_17 : i32
          %42 = arith.addi %c160_i32, %41 : i32
          %43 = arith.addi %42, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %43, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        ^bb3(%44: i32):  // no predecessors
          %true_18 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_19 : i32
          %47 = arith.addi %c176_i32, %46 : i32
          %48 = arith.addi %47, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %48, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %25 = arith.muli %arg5, %c4_i32_9 : i32
        %26 = arith.addi %c192_i32, %25 : i32
        %27 = arith.addi %26, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %27, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      ^bb3(%28: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %30 = arith.remsi %arg3, %c4_i32_12 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %31 = arith.addi %30, %c1_i32_13 : i32
          %32 = arith.cmpi slt, %arg8, %31 : i32
          "simt_step.condition"(%32, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_12 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %31 = arith.muli %arg8, %c4_i32_13 : i32
          %32 = arith.addi %c208_i32, %31 : i32
          %33 = arith.addi %32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_14 = arith.constant 1 : i32
          %34 = arith.addi %arg8, %c1_i32_14 : i32
          "simt_step.break"(%30, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c224_i32 = arith.constant 224 : i32
      %c4_i32_4 = arith.constant 4 : i32
      %9 = arith.muli %arg5, %c4_i32_4 : i32
      %10 = arith.addi %c224_i32, %9 : i32
      %11 = arith.addi %10, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.break"(%7, %12) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %1, %2#0 : i32
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
    %7 = arith.addi %0, %c1_i32 : i32
    %8 = "simt_step.switch"(%6, %7) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %9 = arith.addi %c12_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %11 = simt_step.subgroup_id
      %12 = arith.index_cast %11 : index to i32
      %13 = "simt_step.switch"(%10, %12) ({
      ^bb0(%arg3: i32):
        %35 = simt_step.lane_id
        %36 = arith.index_cast %35 : index to i32
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb1(%37: i32):  // no predecessors
        %c16_i32 = arith.constant 16 : i32
        %38 = arith.addi %c16_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %40 = "simt_step.switch"(%39, %c2_i32) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          %45 = simt_step.subgroup_id
          %46 = arith.index_cast %45 : index to i32
          %true_12 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %47 = arith.addi %c240_i32, %0 : i32
          %true_13 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        ^bb2(%49: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%50: i32):  // no predecessors
          %true_14 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %51 = arith.addi %c256_i32, %0 : i32
          %true_15 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %41 = arith.addi %c272_i32, %0 : i32
        %true_11 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      ^bb2(%43: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %14 = arith.addi %c288_i32, %0 : i32
      %true_0 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb1(%16: i32):  // no predecessors
      %c20_i32 = arith.constant 20 : i32
      %17 = arith.addi %c20_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_1 : i32
      %20 = "simt_step.if"(%19) ({
        %c24_i32 = arith.constant 24 : i32
        %35 = arith.addi %c24_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_10 = arith.constant 1 : i32
        %37 = "simt_step.switch"(%36, %c1_i32_10) ({
        ^bb0(%arg3: i32):
          %38 = simt_step.lane_id
          %39 = arith.index_cast %38 : index to i32
          "simt_step.yield"(%39) {fallthrough = true} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          %c1_i32_11 = arith.constant 1 : i32
          %true_12 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %41 = arith.addi %c304_i32, %0 : i32
          %true_13 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32_11) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%37) : (i32) -> ()
      }, {
        %c28_i32 = arith.constant 28 : i32
        %35 = arith.addi %c28_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_10 : i32
        %38 = "simt_step.if"(%37) ({
          %c4_i32_12 = arith.constant 4 : i32
          %41 = arith.addi %0, %c4_i32_12 : i32
          "simt_step.yield"(%41) : (i32) -> ()
        }, {
          %c1_i32_12 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_12) : (i32) -> ()
        }) : (i1) -> i32
        %c320_i32 = arith.constant 320 : i32
        %39 = arith.addi %c320_i32, %0 : i32
        %true_11 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38) : (i32) -> ()
      }) : (i1) -> i32
      %c336_i32 = arith.constant 336 : i32
      %21 = arith.addi %c336_i32, %0 : i32
      %true_2 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_3 = arith.constant true
      %c352_i32 = arith.constant 352 : i32
      %23 = arith.addi %c352_i32, %0 : i32
      %true_4 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c4_i32_5 = arith.constant 4 : i32
      "simt_step.yield"(%c4_i32_5) {fallthrough = false} : (i32) -> ()
    ^bb3(%26: i32):  // no predecessors
      %c32_i32 = arith.constant 32 : i32
      %27 = arith.addi %c32_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %29 = arith.cmpi ne, %28, %c0_i32_6 : i32
      %30 = "simt_step.if"(%29) ({
        %c36_i32 = arith.constant 36 : i32
        %35 = arith.addi %c36_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_10 : i32
        %38 = "simt_step.if"(%37) ({
          %41 = simt_step.subgroup_id
          %42 = arith.index_cast %41 : index to i32
          "simt_step.yield"(%42) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c368_i32 = arith.constant 368 : i32
        %39 = arith.addi %c368_i32, %0 : i32
        %true_11 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      %c384_i32 = arith.constant 384 : i32
      %31 = arith.addi %c384_i32, %0 : i32
      %true_7 = arith.constant true
      %32 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_8 = arith.constant true
      %c400_i32 = arith.constant 400 : i32
      %33 = arith.addi %c400_i32, %0 : i32
      %true_9 = arith.constant true
      %34 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

