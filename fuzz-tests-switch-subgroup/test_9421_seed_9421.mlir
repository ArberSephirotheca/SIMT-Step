module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %9 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %10 = arith.addi %9, %c1_i32 : i32
      %11 = arith.cmpi slt, %arg5, %10 : i32
      "simt_step.condition"(%11, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true_2 = arith.constant true
      %9 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %c4_i32 = arith.constant 4 : i32
      %10 = arith.muli %arg5, %c4_i32 : i32
      %11 = arith.addi %c0_i32_3, %10 : i32
      %12 = arith.addi %11, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%9, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c2_i32 = arith.constant 2 : i32
    %1 = arith.remsi %arg3, %c2_i32 : i32
    %2 = simt_step.subgroup_id
    %3 = arith.index_cast %2 : index to i32
    %4 = "simt_step.switch"(%1, %3) ({
    ^bb0(%arg4: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %9:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %17 = arith.remsi %arg3, %c4_i32_5 : i32
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %17, %c1_i32 : i32
        %19 = arith.cmpi slt, %arg6, %18 : i32
        "simt_step.condition"(%19, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %18 = "simt_step.if"(%17) ({
          %true_6 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %21 = arith.muli %arg6, %c4_i32_7 : i32
          %22 = arith.addi %c16_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) : (i32) -> ()
        }, {
          %true_6 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %21 = arith.muli %arg6, %c4_i32_7 : i32
          %22 = arith.addi %c32_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32 = arith.constant 1 : i32
        %19 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.break"(%18, %19) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%9#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%10: i32):  // no predecessors
      %c4_i32 = arith.constant 4 : i32
      %11 = arith.remsi %arg3, %c4_i32 : i32
      %12 = simt_step.subgroup_id
      %13 = arith.index_cast %12 : index to i32
      %14 = "simt_step.switch"(%11, %13) ({
      ^bb0(%arg5: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %18 = "simt_step.if"(%17) ({
          %true_9 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %29 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) : (i32) -> ()
        }, {
          %true_9 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %29 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %21 = "simt_step.if"(%20) ({
          %true_9 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %29 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) : (i32) -> ()
        }, {
          %true_9 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %29 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      ^bb2(%22: i32):  // no predecessors
        %true_7 = arith.constant true
        %23 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %24 = arith.addi %c112_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      ^bb3(%25: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %27 = "simt_step.if"(%26) ({
          %true_9 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %29 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) : (i32) -> ()
        }, {
          %true_9 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %29 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      %c160_i32 = arith.constant 160 : i32
      %16 = arith.addi %c160_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c176_i32 = arith.constant 176 : i32
    %6 = arith.addi %c176_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %6, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %8 = arith.select %7, %0#0, %4 : i32
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
    %7 = "simt_step.switch"(%6, %0) ({
    ^bb0(%arg2: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %23 = arith.muli %arg4, %c4_i32_10 : i32
        %24 = arith.addi %23, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %25 = arith.addi %c12_i32, %24 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_11 : i32
        "simt_step.condition"(%27, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c32_i32 = arith.constant 32 : i32
        %23 = arith.addi %c32_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_10 : i32
        %26 = "simt_step.if"(%25) ({
          %c1_i32_15 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_15) : (i32) -> ()
        }, {
          %c4_i32_15 = arith.constant 4 : i32
          %35 = arith.addi %0, %c4_i32_15 : i32
          "simt_step.yield"(%35) : (i32) -> ()
        }) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %27 = arith.addi %c192_i32, %0 : i32
        %true_11 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %29 = arith.addi %arg3, %26 : i32
        %c1_i32 = arith.constant 1 : i32
        %30 = arith.addi %arg4, %c1_i32 : i32
        %true_12 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %c4_i32_13 = arith.constant 4 : i32
        %31 = arith.muli %arg4, %c4_i32_13 : i32
        %32 = arith.addi %c208_i32, %31 : i32
        %33 = arith.addi %32, %0 : i32
        %true_14 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29, %30) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c4_i32_5 = arith.constant 4 : i32
      %18 = arith.addi %0, %c4_i32_5 : i32
      %true_6 = arith.constant true
      %c224_i32 = arith.constant 224 : i32
      %19 = arith.addi %c224_i32, %0 : i32
      %true_7 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb2(%21: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %22:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %23 = arith.muli %arg4, %c4_i32_10 : i32
        %24 = arith.addi %23, %0 : i32
        %c36_i32 = arith.constant 36 : i32
        %25 = arith.addi %c36_i32, %24 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_11 : i32
        "simt_step.condition"(%27, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c56_i32 = arith.constant 56 : i32
        %23 = arith.addi %c56_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_10 : i32
        %26 = "simt_step.if"(%25) ({
          %35 = simt_step.subgroup_id
          %36 = arith.index_cast %35 : index to i32
          "simt_step.yield"(%36) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %35 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%35) : (i32) -> ()
        }) : (i1) -> i32
        %c240_i32 = arith.constant 240 : i32
        %27 = arith.addi %c240_i32, %0 : i32
        %true_11 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %29 = arith.addi %arg3, %26 : i32
        %c1_i32 = arith.constant 1 : i32
        %30 = arith.addi %arg4, %c1_i32 : i32
        %true_12 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %c4_i32_13 = arith.constant 4 : i32
        %31 = arith.muli %arg4, %c4_i32_13 : i32
        %32 = arith.addi %c256_i32, %31 : i32
        %33 = arith.addi %32, %0 : i32
        %true_14 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%29, %30) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%22#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c272_i32 = arith.constant 272 : i32
    %8 = arith.addi %c272_i32, %0 : i32
    %true_0 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c60_i32 = arith.constant 60 : i32
    %10 = arith.addi %c60_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %12 = arith.cmpi ne, %11, %c0_i32_1 : i32
    %13 = "simt_step.if"(%12) ({
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %17 = arith.muli %arg3, %c4_i32_5 : i32
        %18 = arith.addi %17, %0 : i32
        %c64_i32 = arith.constant 64 : i32
        %19 = arith.addi %c64_i32, %18 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_6 : i32
        "simt_step.condition"(%21, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c84_i32 = arith.constant 84 : i32
        %17 = arith.addi %c84_i32, %0 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %18, %c0_i32_5 : i32
        %20 = "simt_step.if"(%19) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %29 = simt_step.subgroup_id
          %30 = arith.index_cast %29 : index to i32
          "simt_step.yield"(%30) : (i32) -> ()
        }) : (i1) -> i32
        %c288_i32 = arith.constant 288 : i32
        %21 = arith.addi %c288_i32, %0 : i32
        %true_6 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %23 = arith.addi %arg2, %20 : i32
        %c1_i32 = arith.constant 1 : i32
        %24 = arith.addi %arg3, %c1_i32 : i32
        %true_7 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %25 = arith.muli %arg3, %c4_i32_8 : i32
        %26 = arith.addi %c304_i32, %25 : i32
        %27 = arith.addi %26, %0 : i32
        %true_9 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%23, %24) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%16#0) : (i32) -> ()
    }, {
      %c88_i32 = arith.constant 88 : i32
      %16 = arith.addi %c88_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_3 : i32
      %19 = "simt_step.if"(%18) ({
        %22 = simt_step.subgroup_id
        %23 = arith.index_cast %22 : index to i32
        "simt_step.yield"(%23) : (i32) -> ()
      }, {
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %23 = arith.muli %arg3, %c4_i32_7 : i32
          %24 = arith.addi %23, %0 : i32
          %c92_i32 = arith.constant 92 : i32
          %25 = arith.addi %c92_i32, %24 : i32
          %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %27 = arith.cmpi ne, %26, %c0_i32_8 : i32
          "simt_step.condition"(%27, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %23 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %24 = arith.addi %arg3, %c1_i32 : i32
          %true_7 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %25 = arith.muli %arg3, %c4_i32_8 : i32
          %26 = arith.addi %c320_i32, %25 : i32
          %27 = arith.addi %26, %0 : i32
          %true_9 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23, %24) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%22#0) : (i32) -> ()
      }) : (i1) -> i32
      %c336_i32 = arith.constant 336 : i32
      %20 = arith.addi %c336_i32, %0 : i32
      %true_4 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) : (i32) -> ()
    }) : (i1) -> i32
    %c352_i32 = arith.constant 352 : i32
    %14 = arith.addi %c352_i32, %0 : i32
    %true_2 = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

