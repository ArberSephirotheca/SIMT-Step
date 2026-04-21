module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
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
        %true = arith.constant true
        %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %c4_i32 = arith.constant 4 : i32
        %4 = arith.muli %arg5, %c4_i32 : i32
        %5 = arith.addi %c0_i32_2, %4 : i32
        %6 = arith.addi %5, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %6, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %7 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%3, %7) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%2#0) : (i32) -> ()
    }, {
      %c4_i32 = arith.constant 4 : i32
      %2 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %3 = arith.addi %arg0, %c1_i32 : i32
      %4 = "simt_step.switch"(%2, %3) ({
      ^bb0(%arg4: i32):
        %c0_i32_0 = arith.constant 0 : i32
        %5 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
        %6 = "simt_step.if"(%5) ({
          %true = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %18 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) : (i32) -> ()
        }, {
          %true = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %18 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
      ^bb1(%7: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %8 = arith.remsi %arg3, %c3_i32 : i32
        %9 = simt_step.lane_id
        %10 = arith.index_cast %9 : index to i32
        %11 = "simt_step.switch"(%8, %10) ({
        ^bb0(%arg5: i32):
          %true = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %18 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          %true_4 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %21 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
        ^bb2(%22: i32):  // no predecessors
          %true_5 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %24 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
        ^bb3(%25: i32):  // no predecessors
          %true_6 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %27 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%11) {fallthrough = true} : (i32) -> ()
      ^bb2(%12: i32):  // no predecessors
        %c0_i32_1 = arith.constant 0 : i32
        %13 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %14 = "simt_step.if"(%13) ({
          %true = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %18 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) : (i32) -> ()
        }, {
          %true = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %18 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%14) {fallthrough = true} : (i32) -> ()
      ^bb3(%15: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_4 = arith.constant 4 : i32
          %17 = arith.remsi %arg3, %c4_i32_4 : i32
          %c1_i32_5 = arith.constant 1 : i32
          %18 = arith.addi %17, %c1_i32_5 : i32
          %19 = arith.cmpi slt, %arg6, %18 : i32
          "simt_step.condition"(%19, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_4 = arith.constant 4 : i32
          %18 = arith.muli %arg6, %c4_i32_4 : i32
          %19 = arith.addi %c144_i32, %18 : i32
          %20 = arith.addi %19, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_5 = arith.constant 1 : i32
          %21 = arith.addi %arg6, %c1_i32_5 : i32
          "simt_step.yield"(%17, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%4) : (i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_3 = arith.constant 4 : i32
      %12 = arith.muli %arg3, %c4_i32_3 : i32
      %13 = arith.addi %12, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %14 = arith.addi %c8_i32, %13 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_4 : i32
      "simt_step.condition"(%16, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c28_i32 = arith.constant 28 : i32
      %12 = arith.addi %c28_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %0, %c1_i32 : i32
      %15 = "simt_step.switch"(%13, %14) ({
      ^bb0(%arg4: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %32 = arith.muli %arg6, %c4_i32_13 : i32
          %33 = arith.addi %32, %0 : i32
          %c32_i32 = arith.constant 32 : i32
          %34 = arith.addi %c32_i32, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_14 : i32
          "simt_step.condition"(%36, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %32 = arith.addi %arg5, %arg6 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %33 = arith.addi %arg6, %c1_i32_13 : i32
          %true_14 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %34 = arith.muli %arg6, %c4_i32_15 : i32
          %35 = arith.addi %c160_i32, %34 : i32
          %36 = arith.addi %35, %0 : i32
          %true_16 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %23 = arith.addi %c176_i32, %0 : i32
        %true_10 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%25: i32):  // no predecessors
        %c52_i32 = arith.constant 52 : i32
        %26 = arith.addi %c52_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_11 : i32
        %29 = "simt_step.if"(%28) ({
          %c3_i32 = arith.constant 3 : i32
          %32 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%32) : (i32) -> ()
        }, {
          %c0_i32_13 = arith.constant 0 : i32
          %32 = arith.addi %0, %c0_i32_13 : i32
          "simt_step.yield"(%32) : (i32) -> ()
        }) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %30 = arith.addi %c192_i32, %0 : i32
        %true_12 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %16 = arith.addi %arg2, %15 : i32
      %c1_i32_3 = arith.constant 1 : i32
      %17 = arith.addi %arg3, %c1_i32_3 : i32
      %true_4 = arith.constant true
      %c208_i32 = arith.constant 208 : i32
      %c4_i32_5 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_5 : i32
      %19 = arith.addi %c208_i32, %18 : i32
      %20 = arith.addi %19, %0 : i32
      %true_6 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16, %17) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c56_i32 = arith.constant 56 : i32
    %6 = arith.addi %c56_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_2 : i32
    %9 = "simt_step.if"(%8) ({
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %13 = arith.muli %arg3, %c4_i32_5 : i32
        %14 = arith.addi %13, %0 : i32
        %c60_i32 = arith.constant 60 : i32
        %15 = arith.addi %c60_i32, %14 : i32
        %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %16, %c0_i32_6 : i32
        "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %13 = simt_step.lane_id
        %14 = arith.index_cast %13 : index to i32
        %15 = arith.addi %arg2, %14 : i32
        %c1_i32 = arith.constant 1 : i32
        %16 = arith.addi %arg3, %c1_i32 : i32
        %true_5 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %c4_i32_6 = arith.constant 4 : i32
        %17 = arith.muli %arg3, %c4_i32_6 : i32
        %18 = arith.addi %c224_i32, %17 : i32
        %19 = arith.addi %18, %0 : i32
        %true_7 = arith.constant true
        %20 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%15, %16) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%12#0) : (i32) -> ()
    }, {
      %c80_i32 = arith.constant 80 : i32
      %12 = arith.addi %c80_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %14 = "simt_step.switch"(%13, %0) ({
      ^bb0(%arg2: i32):
        %c84_i32 = arith.constant 84 : i32
        %15 = arith.addi %c84_i32, %0 : i32
        %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %17 = arith.addi %0, %c2_i32 : i32
        %18 = "simt_step.switch"(%16, %17) ({
        ^bb0(%arg3: i32):
          %33 = simt_step.lane_id
          %34 = arith.index_cast %33 : index to i32
          "simt_step.yield"(%34) {fallthrough = true} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          %c4_i32_11 = arith.constant 4 : i32
          %true_12 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %36 = arith.addi %c240_i32, %0 : i32
          %true_13 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_11) {fallthrough = false} : (i32) -> ()
        ^bb2(%38: i32):  // no predecessors
          %39 = simt_step.subgroup_id
          %40 = arith.index_cast %39 : index to i32
          %true_14 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %41 = arith.addi %c256_i32, %0 : i32
          %true_15 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        ^bb3(%43: i32):  // no predecessors
          %44 = simt_step.subgroup_id
          %45 = arith.index_cast %44 : index to i32
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_3 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %19 = arith.addi %c272_i32, %0 : i32
        %true_4 = arith.constant true
        %20 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%18) {fallthrough = true} : (i32) -> ()
      ^bb1(%21: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %33 = arith.muli %arg4, %c4_i32_11 : i32
          %34 = arith.addi %33, %0 : i32
          %c88_i32 = arith.constant 88 : i32
          %35 = arith.addi %c88_i32, %34 : i32
          %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %37 = arith.cmpi ne, %36, %c0_i32_12 : i32
          "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %33 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %34 = arith.addi %arg4, %c1_i32 : i32
          %true_11 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_12 : i32
          %36 = arith.addi %c288_i32, %35 : i32
          %37 = arith.addi %36, %0 : i32
          %true_13 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%22#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%23: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
      ^bb3(%24: i32):  // no predecessors
        %c108_i32 = arith.constant 108 : i32
        %25 = arith.addi %c108_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_7 : i32
        %28 = "simt_step.if"(%27) ({
          %33 = simt_step.lane_id
          %34 = arith.index_cast %33 : index to i32
          "simt_step.yield"(%34) : (i32) -> ()
        }, {
          %c4_i32_11 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_11) : (i32) -> ()
        }) : (i1) -> i32
        %c304_i32 = arith.constant 304 : i32
        %29 = arith.addi %c304_i32, %0 : i32
        %true_8 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_9 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %31 = arith.addi %c320_i32, %0 : i32
        %true_10 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%14) : (i32) -> ()
    }) : (i1) -> i32
    %c336_i32 = arith.constant 336 : i32
    %10 = arith.addi %c336_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

