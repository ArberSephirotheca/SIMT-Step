module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %1 = simt_step.subgroup_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %true = arith.constant true
      %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32 = arith.constant 0 : i32
      %5 = arith.addi %c0_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%4) {fallthrough = false} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %c0_i32_0 = arith.constant 0 : i32
      %7 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %8 = "simt_step.if"(%7) ({
        %true_3 = arith.constant true
        %17 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %18 = arith.addi %c16_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%17) : (i32) -> ()
      }, {
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %18 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %19 = arith.addi %18, %c1_i32 : i32
          %20 = arith.cmpi slt, %arg6, %19 : i32
          "simt_step.condition"(%20, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_5 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %19 = arith.muli %arg6, %c4_i32 : i32
          %20 = arith.addi %c32_i32, %19 : i32
          %21 = arith.addi %20, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %22 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%18, %22) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%17#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%8) {fallthrough = true} : (i32) -> ()
    ^bb2(%9: i32):  // no predecessors
      %c3_i32_1 = arith.constant 3 : i32
      %10 = arith.remsi %arg3, %c3_i32_1 : i32
      %11 = simt_step.lane_id
      %12 = arith.index_cast %11 : index to i32
      %13 = "simt_step.switch"(%10, %12) ({
      ^bb0(%arg5: i32):
        %true_3 = arith.constant true
        %17 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %18 = arith.addi %c48_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %20:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %27 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %28 = arith.addi %27, %c1_i32 : i32
          %29 = arith.cmpi slt, %arg7, %28 : i32
          "simt_step.condition"(%29, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_8 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32 = arith.constant 4 : i32
          %28 = arith.muli %arg7, %c4_i32 : i32
          %29 = arith.addi %c64_i32, %28 : i32
          %30 = arith.addi %29, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %31 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%27, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%20#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%21: i32):  // no predecessors
        %true_6 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %23 = arith.addi %c80_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
      ^bb3(%24: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %26 = "simt_step.if"(%25) ({
          %true_8 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %28 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) : (i32) -> ()
        }, {
          %true_8 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %28 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb3(%14: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %16 = "simt_step.if"(%15) ({
        %c0_i32_3 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %18 = "simt_step.if"(%17) ({
          %true_4 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %20 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) : (i32) -> ()
        }, {
          %true_4 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %20 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%18) : (i32) -> ()
      }, {
        %c3_i32_3 = arith.constant 3 : i32
        %17 = arith.remsi %arg3, %c3_i32_3 : i32
        %18 = simt_step.subgroup_id
        %19 = arith.index_cast %18 : index to i32
        %20 = "simt_step.switch"(%17, %19) ({
        ^bb0(%arg5: i32):
          %true_4 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %22 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          %true_5 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %25 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb2(%26: i32):  // no predecessors
          %true_6 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %28 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb3(%29: i32):  // no predecessors
          %true_7 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %31 = arith.addi %c208_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%20) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
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
    %c4_i32_0 = arith.constant 4 : i32
    %5 = simt_step.lane_id
    %6 = arith.index_cast %5 : index to i32
    %c1_i32 = arith.constant 1 : i32
    %c8_i32 = arith.constant 8 : i32
    %7 = arith.addi %c8_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %9 = arith.cmpi ne, %8, %c0_i32_1 : i32
    %10 = "simt_step.if"(%9) ({
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %21 = arith.muli %arg3, %c4_i32_6 : i32
        %22 = arith.addi %21, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %23 = arith.addi %c12_i32, %22 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_7 : i32
        "simt_step.condition"(%25, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %21 = arith.addi %arg2, %arg3 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %22 = arith.addi %arg3, %c1_i32_6 : i32
        %true_7 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %23 = arith.muli %arg3, %c4_i32_8 : i32
        %24 = arith.addi %c224_i32, %23 : i32
        %25 = arith.addi %24, %0 : i32
        %true_9 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%20#0) : (i32) -> ()
    }, {
      %c1_i32_4 = arith.constant 1 : i32
      %20 = arith.addi %0, %c1_i32_4 : i32
      "simt_step.yield"(%20) : (i32) -> ()
    }) : (i1) -> i32
    %c240_i32 = arith.constant 240 : i32
    %11 = arith.addi %c240_i32, %0 : i32
    %true = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c32_i32 = arith.constant 32 : i32
    %13 = arith.addi %c32_i32, %0 : i32
    %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
    %15 = simt_step.subgroup_id
    %16 = arith.index_cast %15 : index to i32
    %17 = "simt_step.switch"(%14, %16) ({
    ^bb0(%arg2: i32):
      %c3_i32 = arith.constant 3 : i32
      %true_4 = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %20 = arith.addi %c256_i32, %0 : i32
      %true_5 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_8 : i32
        %31 = arith.addi %30, %0 : i32
        %c36_i32 = arith.constant 36 : i32
        %32 = arith.addi %c36_i32, %31 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_9 : i32
        "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c56_i32 = arith.constant 56 : i32
        %30 = arith.addi %c56_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_8 : i32
        %33 = "simt_step.if"(%32) ({
          %42 = simt_step.lane_id
          %43 = arith.index_cast %42 : index to i32
          "simt_step.yield"(%43) : (i32) -> ()
        }, {
          %42 = simt_step.lane_id
          %43 = arith.index_cast %42 : index to i32
          "simt_step.yield"(%43) : (i32) -> ()
        }) : (i1) -> i32
        %c272_i32 = arith.constant 272 : i32
        %34 = arith.addi %c272_i32, %0 : i32
        %true_9 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %36 = arith.addi %arg3, %33 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %37 = arith.addi %arg4, %c1_i32_10 : i32
        %true_11 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %c4_i32_12 = arith.constant 4 : i32
        %38 = arith.muli %arg4, %c4_i32_12 : i32
        %39 = arith.addi %c288_i32, %38 : i32
        %40 = arith.addi %39, %0 : i32
        %true_13 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36, %37) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%23#0) {fallthrough = true} : (i32) -> ()
    ^bb2(%24: i32):  // no predecessors
      %c60_i32 = arith.constant 60 : i32
      %25 = arith.addi %c60_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %27 = simt_step.lane_id
      %28 = arith.index_cast %27 : index to i32
      %29 = "simt_step.switch"(%26, %28) ({
      ^bb0(%arg3: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %40 = arith.muli %arg5, %c4_i32_14 : i32
          %41 = arith.addi %40, %0 : i32
          %c64_i32 = arith.constant 64 : i32
          %42 = arith.addi %c64_i32, %41 : i32
          %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %44 = arith.cmpi ne, %43, %c0_i32_15 : i32
          "simt_step.condition"(%44, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %40 = arith.addi %arg4, %arg5 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %41 = arith.addi %arg5, %c1_i32_14 : i32
          %true_15 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %42 = arith.muli %arg5, %c4_i32_16 : i32
          %43 = arith.addi %c304_i32, %42 : i32
          %44 = arith.addi %43, %0 : i32
          %true_17 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40, %41) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c84_i32 = arith.constant 84 : i32
        %32 = arith.addi %c84_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_10 : i32
        %35 = "simt_step.if"(%34) ({
          %c4_i32_14 = arith.constant 4 : i32
          %40 = arith.addi %0, %c4_i32_14 : i32
          "simt_step.yield"(%40) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c320_i32 = arith.constant 320 : i32
        %36 = arith.addi %c320_i32, %0 : i32
        %true_11 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_12 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %38 = arith.addi %c336_i32, %0 : i32
        %true_13 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_2 = arith.constant true
    %c352_i32 = arith.constant 352 : i32
    %18 = arith.addi %c352_i32, %0 : i32
    %true_3 = arith.constant true
    %19 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

