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
      %c4_i32_7 = arith.constant 4 : i32
      %14 = arith.remsi %arg3, %c4_i32_7 : i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %14, %c1_i32 : i32
      %16 = arith.cmpi slt, %arg5, %15 : i32
      "simt_step.condition"(%16, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true_7 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %c4_i32_8 = arith.constant 4 : i32
      %15 = arith.muli %arg5, %c4_i32_8 : i32
      %16 = arith.addi %c16_i32, %15 : i32
      %17 = arith.addi %16, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %17, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %18 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.break"(%14, %18) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %0, %2#0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32_7 = arith.constant 4 : i32
      %14 = arith.remsi %arg3, %c4_i32_7 : i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %14, %c1_i32 : i32
      %16 = arith.cmpi slt, %arg5, %15 : i32
      "simt_step.condition"(%16, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true_7 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %c4_i32_8 = arith.constant 4 : i32
      %15 = arith.muli %arg5, %c4_i32_8 : i32
      %16 = arith.addi %c32_i32, %15 : i32
      %17 = arith.addi %16, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %17, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %18 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%14, %18) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_5 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
    %7 = arith.select %6, %4, %5#0 : i32
    %c4_i32 = arith.constant 4 : i32
    %8 = arith.remsi %arg3, %c4_i32 : i32
    %9 = simt_step.lane_id
    %10 = arith.index_cast %9 : index to i32
    %11 = "simt_step.switch"(%8, %10) ({
    ^bb0(%arg4: i32):
      %c2_i32 = arith.constant 2 : i32
      %14 = arith.remsi %arg3, %c2_i32 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %15 = arith.addi %arg0, %c0_i32_7 : i32
      %16 = "simt_step.switch"(%14, %15) ({
      ^bb0(%arg5: i32):
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %30 = arith.remsi %arg3, %c4_i32_14 : i32
          %c1_i32 = arith.constant 1 : i32
          %31 = arith.addi %30, %c1_i32 : i32
          %32 = arith.cmpi slt, %arg7, %31 : i32
          "simt_step.condition"(%32, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_14 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %31 = arith.muli %arg7, %c4_i32_15 : i32
          %32 = arith.addi %c48_i32, %31 : i32
          %33 = arith.addi %32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %34 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%30, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%26#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %arg2, %c0_i32_13 : i32
        %29 = "simt_step.if"(%28) ({
          %true_14 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %31 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) : (i32) -> ()
        }, {
          %true_14 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %31 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%16) {fallthrough = true} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
      %19 = "simt_step.if"(%18) ({
        %true_11 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %27 = arith.addi %c96_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26) : (i32) -> ()
      }, {
        %true_11 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %27 = arith.addi %c112_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb2(%20: i32):  // no predecessors
      %c0_i32_9 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
      %22 = "simt_step.if"(%21) ({
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %27 = arith.remsi %arg3, %c4_i32_13 : i32
          %c1_i32 = arith.constant 1 : i32
          %28 = arith.addi %27, %c1_i32 : i32
          %29 = arith.cmpi slt, %arg6, %28 : i32
          "simt_step.condition"(%29, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_13 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %28 = arith.muli %arg6, %c4_i32_14 : i32
          %29 = arith.addi %c128_i32, %28 : i32
          %30 = arith.addi %29, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %31 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%27, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%26#0) : (i32) -> ()
      }, {
        %true_11 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        %c144_i32 = arith.constant 144 : i32
        %27 = arith.addi %c144_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
    ^bb3(%23: i32):  // no predecessors
      %true_10 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      %c160_i32 = arith.constant 160 : i32
      %25 = arith.addi %c160_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %c0_i32_6 = arith.constant 0 : i32
    %12 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
    %13 = arith.select %12, %7, %11 : i32
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
      "simt_step.yield"() : () -> ()
    }, {
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c2_i32 = arith.constant 2 : i32
        %15 = arith.cmpi slt, %arg3, %c2_i32 : i32
        "simt_step.condition"(%15, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c2_i32 = arith.constant 2 : i32
        %15 = arith.remsi %0, %c2_i32 : i32
        %16 = simt_step.subgroup_id
        %17 = arith.index_cast %16 : index to i32
        %18 = "simt_step.switch"(%15, %17) ({
        ^bb0(%arg4: i32):
          %c1_i32_8 = arith.constant 1 : i32
          %20 = arith.addi %arg4, %c1_i32_8 : i32
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb1(%21: i32):  // no predecessors
          %c4_i32_9 = arith.constant 4 : i32
          %22 = arith.addi %21, %c4_i32_9 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        ^bb2(%23: i32):  // no predecessors
          %c4_i32_10 = arith.constant 4 : i32
          %24 = arith.addi %23, %c4_i32_10 : i32
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %19 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%arg2, %19) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_6 : i32
      %15 = arith.addi %14, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %16 = arith.addi %c8_i32, %15 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_7 : i32
      "simt_step.condition"(%18, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %14 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg3, %c1_i32 : i32
      %true_6 = arith.constant true
      %c176_i32 = arith.constant 176 : i32
      %c4_i32_7 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_7 : i32
      %17 = arith.addi %c176_i32, %16 : i32
      %18 = arith.addi %17, %0 : i32
      %true_8 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14, %15) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %7:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_6 : i32
      %15 = arith.addi %14, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %16 = arith.addi %c28_i32, %15 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_7 : i32
      "simt_step.condition"(%18, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %14 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg3, %c1_i32 : i32
      %true_6 = arith.constant true
      %c192_i32 = arith.constant 192 : i32
      %c4_i32_7 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_7 : i32
      %17 = arith.addi %c192_i32, %16 : i32
      %18 = arith.addi %17, %0 : i32
      %true_8 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14, %15) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c48_i32 = arith.constant 48 : i32
    %8 = arith.addi %c48_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_5 = arith.constant 0 : i32
    %10 = arith.cmpi ne, %9, %c0_i32_5 : i32
    %11 = "simt_step.if"(%10) ({
      %c52_i32 = arith.constant 52 : i32
      %14 = arith.addi %c52_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %16 = simt_step.lane_id
      %17 = arith.index_cast %16 : index to i32
      %18 = "simt_step.switch"(%15, %17) ({
      ^bb0(%arg2: i32):
        %c3_i32 = arith.constant 3 : i32
        %true_6 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %19 = arith.addi %c208_i32, %0 : i32
        %true_7 = arith.constant true
        %20 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
      ^bb1(%21: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %22 = arith.addi %c56_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %24 = simt_step.lane_id
        %25 = arith.index_cast %24 : index to i32
        %26 = "simt_step.switch"(%23, %25) ({
        ^bb0(%arg3: i32):
          %27 = simt_step.subgroup_id
          %28 = arith.index_cast %27 : index to i32
          %true_8 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %29 = arith.addi %c224_i32, %0 : i32
          %true_9 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = true} : (i32) -> ()
        ^bb1(%31: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %true_10 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %32 = arith.addi %c240_i32, %0 : i32
          %true_11 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32) {fallthrough = true} : (i32) -> ()
        ^bb2(%34: i32):  // no predecessors
          %35 = simt_step.lane_id
          %36 = arith.index_cast %35 : index to i32
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%18) : (i32) -> ()
    }, {
      %c60_i32 = arith.constant 60 : i32
      %14 = arith.addi %c60_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %16 = arith.addi %0, %c3_i32 : i32
      %17 = "simt_step.switch"(%15, %16) ({
      ^bb0(%arg2: i32):
        %c64_i32 = arith.constant 64 : i32
        %18 = arith.addi %c64_i32, %0 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %20 = "simt_step.switch"(%19, %c1_i32) ({
        ^bb0(%arg3: i32):
          %c4_i32_11 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_11) {fallthrough = false} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          %27 = simt_step.subgroup_id
          %28 = arith.index_cast %27 : index to i32
          %true_12 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %29 = arith.addi %c256_i32, %0 : i32
          %true_13 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %32 = simt_step.lane_id
          %33 = arith.index_cast %32 : index to i32
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %21 = arith.addi %c272_i32, %0 : i32
        %true_7 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c1_i32_8 = arith.constant 1 : i32
        %true_9 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %24 = arith.addi %c288_i32, %0 : i32
        %true_10 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c1_i32_8) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%17) : (i32) -> ()
    }) : (i1) -> i32
    %c304_i32 = arith.constant 304 : i32
    %12 = arith.addi %c304_i32, %0 : i32
    %true = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

