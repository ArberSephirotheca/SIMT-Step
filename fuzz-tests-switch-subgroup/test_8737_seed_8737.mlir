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
      %c3_i32 = arith.constant 3 : i32
      %5 = arith.remsi %arg3, %c3_i32 : i32
      %c4_i32 = arith.constant 4 : i32
      %6 = arith.addi %arg0, %c4_i32 : i32
      %7 = "simt_step.switch"(%5, %6) ({
      ^bb0(%arg6: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %9 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %10 = "simt_step.if"(%9) ({
          %true_10 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %26 = arith.muli %arg5, %c4_i32_11 : i32
          %27 = arith.addi %c16_i32, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) : (i32) -> ()
        }, {
          %true_10 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %26 = arith.muli %arg5, %c4_i32_11 : i32
          %27 = arith.addi %c32_i32, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
      ^bb1(%11: i32):  // no predecessors
        %c4_i32_4 = arith.constant 4 : i32
        %12 = arith.remsi %arg3, %c4_i32_4 : i32
        %13 = simt_step.subgroup_id
        %14 = arith.index_cast %13 : index to i32
        %15 = "simt_step.switch"(%12, %14) ({
        ^bb0(%arg7: i32):
          %true_10 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %26 = arith.muli %arg5, %c4_i32_11 : i32
          %27 = arith.addi %c48_i32, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %true_12 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %31 = arith.muli %arg5, %c4_i32_13 : i32
          %32 = arith.addi %c64_i32, %31 : i32
          %33 = arith.addi %32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        ^bb2(%34: i32):  // no predecessors
          %true_14 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %36 = arith.muli %arg5, %c4_i32_15 : i32
          %37 = arith.addi %c80_i32, %36 : i32
          %38 = arith.addi %37, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %38, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        ^bb3(%39: i32):  // no predecessors
          %true_16 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %41 = arith.muli %arg5, %c4_i32_17 : i32
          %42 = arith.addi %c96_i32, %41 : i32
          %43 = arith.addi %42, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %43, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        %16 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %c4_i32_6 = arith.constant 4 : i32
        %17 = arith.muli %arg5, %c4_i32_6 : i32
        %18 = arith.addi %c112_i32, %17 : i32
        %19 = arith.addi %18, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
      ^bb2(%20: i32):  // no predecessors
        %c1_i32_7 = arith.constant 1 : i32
        %21 = arith.addi %arg0, %c1_i32_7 : i32
        %22 = "simt_step.switch"(%arg3, %21) ({
        ^bb0(%arg7: i32):
          %true_10 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %26 = arith.muli %arg5, %c4_i32_11 : i32
          %27 = arith.addi %c128_i32, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %true_12 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %31 = arith.muli %arg5, %c4_i32_13 : i32
          %32 = arith.addi %c144_i32, %31 : i32
          %33 = arith.addi %32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb3(%23: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %25 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %26 = arith.addi %25, %c1_i32_11 : i32
          %27 = arith.cmpi slt, %arg8, %26 : i32
          "simt_step.condition"(%27, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_10 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %26 = arith.muli %arg8, %c4_i32_11 : i32
          %27 = arith.addi %c160_i32, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_12 = arith.constant 1 : i32
          %29 = arith.addi %arg8, %c1_i32_12 : i32
          "simt_step.yield"(%25, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %8 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%7, %8) : (i32, i32) -> ()
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
    call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
    %5 = simt_step.subgroup_id
    %6 = arith.index_cast %5 : index to i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %7:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_2 = arith.constant 4 : i32
      %11 = arith.muli %arg3, %c4_i32_2 : i32
      %12 = arith.addi %11, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %13 = arith.addi %c8_i32, %12 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_3 : i32
      "simt_step.condition"(%15, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %18 = arith.muli %arg5, %c4_i32_7 : i32
        %19 = arith.addi %18, %0 : i32
        %c28_i32 = arith.constant 28 : i32
        %20 = arith.addi %c28_i32, %19 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %21, %c0_i32_8 : i32
        "simt_step.condition"(%22, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %18 = arith.addi %arg4, %arg5 : i32
        %c1_i32_7 = arith.constant 1 : i32
        %19 = arith.addi %arg5, %c1_i32_7 : i32
        %true_8 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %20 = arith.muli %arg5, %c4_i32_9 : i32
        %21 = arith.addi %c176_i32, %20 : i32
        %22 = arith.addi %21, %0 : i32
        %true_10 = arith.constant true
        %23 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%18, %19) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %12 = arith.addi %arg2, %11#0 : i32
      %c1_i32_4 = arith.constant 1 : i32
      %13 = arith.addi %arg3, %c1_i32_4 : i32
      %true = arith.constant true
      %c192_i32 = arith.constant 192 : i32
      %c4_i32_5 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_5 : i32
      %15 = arith.addi %c192_i32, %14 : i32
      %16 = arith.addi %15, %0 : i32
      %true_6 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%12, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c48_i32 = arith.constant 48 : i32
    %8 = arith.addi %c48_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %10 = "simt_step.switch"(%9, %c1_i32) ({
    ^bb0(%arg2: i32):
      %c52_i32 = arith.constant 52 : i32
      %11 = arith.addi %c52_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %13 = "simt_step.switch"(%12, %0) ({
      ^bb0(%arg3: i32):
        %41 = simt_step.subgroup_id
        %42 = arith.index_cast %41 : index to i32
        "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
      ^bb1(%43: i32):  // no predecessors
        %c4_i32_13 = arith.constant 4 : i32
        %true_14 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %44 = arith.addi %c208_i32, %0 : i32
        %true_15 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c4_i32_13) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c224_i32 = arith.constant 224 : i32
      %14 = arith.addi %c224_i32, %0 : i32
      %true_2 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_3 = arith.constant true
      %c240_i32 = arith.constant 240 : i32
      %16 = arith.addi %c240_i32, %0 : i32
      %true_4 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c56_i32 = arith.constant 56 : i32
      %19 = arith.addi %c56_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_5 : i32
      %22 = "simt_step.if"(%21) ({
        %c60_i32 = arith.constant 60 : i32
        %41 = arith.addi %c60_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %43 = simt_step.lane_id
        %44 = arith.index_cast %43 : index to i32
        %45 = "simt_step.switch"(%42, %44) ({
        ^bb0(%arg3: i32):
          %46 = simt_step.lane_id
          %47 = arith.index_cast %46 : index to i32
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %true_13 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %49 = arith.addi %c256_i32, %0 : i32
          %true_14 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%51: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%45) : (i32) -> ()
      }, {
        %c4_i32_13 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_13) : (i32) -> ()
      }) : (i1) -> i32
      %c272_i32 = arith.constant 272 : i32
      %23 = arith.addi %c272_i32, %0 : i32
      %true_6 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c64_i32 = arith.constant 64 : i32
      %26 = arith.addi %c64_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %28 = arith.cmpi ne, %27, %c0_i32_7 : i32
      %29 = "simt_step.if"(%28) ({
        %c68_i32 = arith.constant 68 : i32
        %41 = arith.addi %c68_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_13 : i32
        %44 = "simt_step.if"(%43) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c288_i32 = arith.constant 288 : i32
        %45 = arith.addi %c288_i32, %0 : i32
        %true_14 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) : (i32) -> ()
      }, {
        %c72_i32 = arith.constant 72 : i32
        %41 = arith.addi %c72_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_13 : i32
        %44 = "simt_step.if"(%43) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %47 = simt_step.subgroup_id
          %48 = arith.index_cast %47 : index to i32
          "simt_step.yield"(%48) : (i32) -> ()
        }) : (i1) -> i32
        %c304_i32 = arith.constant 304 : i32
        %45 = arith.addi %c304_i32, %0 : i32
        %true_14 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) : (i32) -> ()
      }) : (i1) -> i32
      %c320_i32 = arith.constant 320 : i32
      %30 = arith.addi %c320_i32, %0 : i32
      %true_8 = arith.constant true
      %31 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_9 = arith.constant true
      %c336_i32 = arith.constant 336 : i32
      %32 = arith.addi %c336_i32, %0 : i32
      %true_10 = arith.constant true
      %33 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
    ^bb3(%34: i32):  // no predecessors
      %c76_i32 = arith.constant 76 : i32
      %35 = arith.addi %c76_i32, %0 : i32
      %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_11 = arith.constant 0 : i32
      %37 = arith.cmpi ne, %36, %c0_i32_11 : i32
      %38 = "simt_step.if"(%37) ({
        %41 = simt_step.subgroup_id
        %42 = arith.index_cast %41 : index to i32
        "simt_step.yield"(%42) : (i32) -> ()
      }, {
        %c80_i32 = arith.constant 80 : i32
        %41 = arith.addi %c80_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %43 = simt_step.lane_id
        %44 = arith.index_cast %43 : index to i32
        %45 = "simt_step.switch"(%42, %44) ({
        ^bb0(%arg3: i32):
          %c3_i32 = arith.constant 3 : i32
          %46 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%46) {fallthrough = true} : (i32) -> ()
        ^bb1(%47: i32):  // no predecessors
          %c1_i32_13 = arith.constant 1 : i32
          %true_14 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %48 = arith.addi %c352_i32, %0 : i32
          %true_15 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32_13) {fallthrough = true} : (i32) -> ()
        ^bb2(%50: i32):  // no predecessors
          %51 = simt_step.subgroup_id
          %52 = arith.index_cast %51 : index to i32
          %true_16 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %53 = arith.addi %c368_i32, %0 : i32
          %true_17 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%45) : (i32) -> ()
      }) : (i1) -> i32
      %c384_i32 = arith.constant 384 : i32
      %39 = arith.addi %c384_i32, %0 : i32
      %true_12 = arith.constant true
      %40 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

