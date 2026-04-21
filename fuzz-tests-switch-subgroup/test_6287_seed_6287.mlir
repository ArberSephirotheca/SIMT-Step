module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %5 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %5, %c1_i32 : i32
      %7 = arith.cmpi slt, %arg5, %6 : i32
      "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true = arith.constant true
      %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %c4_i32 = arith.constant 4 : i32
      %6 = arith.muli %arg5, %c4_i32 : i32
      %7 = arith.addi %c0_i32_2, %6 : i32
      %8 = arith.addi %7, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.break"(%5, %9) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c3_i32 = arith.constant 3 : i32
    %1 = arith.remsi %arg3, %c3_i32 : i32
    %2 = "simt_step.switch"(%1, %arg0) ({
    ^bb0(%arg4: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %5:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %11 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %12 = arith.addi %11, %c1_i32 : i32
        %13 = arith.cmpi slt, %arg6, %12 : i32
        "simt_step.condition"(%13, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %11 = arith.remsi %arg3, %c4_i32 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %12 = arith.addi %arg0, %c0_i32_7 : i32
        %13 = "simt_step.switch"(%11, %12) ({
        ^bb0(%arg7: i32):
          %true = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %16 = arith.muli %arg6, %c4_i32_8 : i32
          %17 = arith.addi %c16_i32, %16 : i32
          %18 = arith.addi %17, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          %true_9 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %21 = arith.muli %arg6, %c4_i32_10 : i32
          %22 = arith.addi %c32_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
        ^bb2(%24: i32):  // no predecessors
          %true_11 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %26 = arith.muli %arg6, %c4_i32_12 : i32
          %27 = arith.addi %c48_i32, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
        ^bb3(%29: i32):  // no predecessors
          %true_13 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %31 = arith.muli %arg6, %c4_i32_14 : i32
          %32 = arith.addi %c64_i32, %31 : i32
          %33 = arith.addi %32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%13, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%5#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %7:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %11 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %12 = arith.addi %11, %c1_i32 : i32
        %13 = arith.cmpi slt, %arg6, %12 : i32
        "simt_step.condition"(%13, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %true = arith.constant true
        %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %c4_i32 = arith.constant 4 : i32
        %12 = arith.muli %arg6, %c4_i32 : i32
        %13 = arith.addi %c80_i32, %12 : i32
        %14 = arith.addi %13, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %14, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %15 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.break"(%11, %15) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%7#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%8: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %9 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
      %10 = "simt_step.if"(%9) ({
        %c0_i32_7 = arith.constant 0 : i32
        %11 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %12 = "simt_step.if"(%11) ({
          %true = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %14 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%13) : (i32) -> ()
        }, {
          %true = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %14 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%13) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%12) : (i32) -> ()
      }, {
        %true = arith.constant true
        %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %12 = arith.addi %c128_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%11) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %4 = arith.select %3, %0#0, %2 : i32
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
      %11 = arith.muli %arg3, %c4_i32_3 : i32
      %12 = arith.addi %11, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %13 = arith.addi %c8_i32, %12 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_4 : i32
      "simt_step.condition"(%15, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %11 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c144_i32 = arith.constant 144 : i32
      %c4_i32_3 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_3 : i32
      %14 = arith.addi %c144_i32, %13 : i32
      %15 = arith.addi %14, %0 : i32
      %true_4 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11, %12) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %6 = simt_step.subgroup_id
    %7 = arith.index_cast %6 : index to i32
    %c28_i32 = arith.constant 28 : i32
    %8 = arith.addi %c28_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c4_i32_2 = arith.constant 4 : i32
    %10 = "simt_step.switch"(%9, %c4_i32_2) ({
    ^bb0(%arg2: i32):
      %c32_i32 = arith.constant 32 : i32
      %11 = arith.addi %c32_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_3 = arith.constant 4 : i32
      %13 = arith.addi %0, %c4_i32_3 : i32
      %14 = "simt_step.switch"(%12, %13) ({
      ^bb0(%arg3: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %41 = arith.muli %arg5, %c4_i32_18 : i32
          %42 = arith.addi %41, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %43 = arith.addi %c36_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_19 : i32
          "simt_step.condition"(%45, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %41 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %42 = arith.addi %arg5, %c1_i32 : i32
          %true_18 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %43 = arith.muli %arg5, %c4_i32_19 : i32
          %44 = arith.addi %c160_i32, %43 : i32
          %45 = arith.addi %44, %0 : i32
          %true_20 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%31#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %33 = arith.addi %c56_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_14 : i32
        %36 = "simt_step.if"(%35) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %41 = simt_step.subgroup_id
          %42 = arith.index_cast %41 : index to i32
          "simt_step.yield"(%42) : (i32) -> ()
        }) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %37 = arith.addi %c176_i32, %0 : i32
        %true_15 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_16 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %39 = arith.addi %c192_i32, %0 : i32
        %true_17 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c208_i32 = arith.constant 208 : i32
      %15 = arith.addi %c208_i32, %0 : i32
      %true_4 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %31 = arith.muli %arg4, %c4_i32_12 : i32
        %32 = arith.addi %31, %0 : i32
        %c60_i32 = arith.constant 60 : i32
        %33 = arith.addi %c60_i32, %32 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_13 : i32
        "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %31 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %32 = arith.addi %arg4, %c1_i32 : i32
        %true_12 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %c4_i32_13 = arith.constant 4 : i32
        %33 = arith.muli %arg4, %c4_i32_13 : i32
        %34 = arith.addi %c224_i32, %33 : i32
        %35 = arith.addi %34, %0 : i32
        %true_14 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31, %32) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%18#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%19: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %20 = arith.addi %0, %c0_i32_7 : i32
      %true_8 = arith.constant true
      %c240_i32 = arith.constant 240 : i32
      %21 = arith.addi %c240_i32, %0 : i32
      %true_9 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb3(%23: i32):  // no predecessors
      %c80_i32 = arith.constant 80 : i32
      %24 = arith.addi %c80_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %26 = simt_step.subgroup_id
      %27 = arith.index_cast %26 : index to i32
      %28 = "simt_step.switch"(%25, %27) ({
      ^bb0(%arg3: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %37 = arith.muli %arg5, %c4_i32_16 : i32
          %38 = arith.addi %37, %0 : i32
          %c84_i32 = arith.constant 84 : i32
          %39 = arith.addi %c84_i32, %38 : i32
          %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %41 = arith.cmpi ne, %40, %c0_i32_17 : i32
          "simt_step.condition"(%41, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %37 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %38 = arith.addi %arg5, %c1_i32 : i32
          %true_16 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %39 = arith.muli %arg5, %c4_i32_17 : i32
          %40 = arith.addi %c256_i32, %39 : i32
          %41 = arith.addi %40, %0 : i32
          %true_18 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%37, %38) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%31#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %33 = simt_step.subgroup_id
        %34 = arith.index_cast %33 : index to i32
        %true_14 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %35 = arith.addi %c272_i32, %0 : i32
        %true_15 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_10 = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %29 = arith.addi %c288_i32, %0 : i32
      %true_11 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

