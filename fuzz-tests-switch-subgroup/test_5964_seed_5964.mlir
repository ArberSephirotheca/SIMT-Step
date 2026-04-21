module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c3_i32 = arith.constant 3 : i32
    %2 = arith.remsi %arg3, %c3_i32 : i32
    %3 = simt_step.lane_id
    %4 = arith.index_cast %3 : index to i32
    %5 = "simt_step.switch"(%2, %4) ({
    ^bb0(%arg4: i32):
      %true_1 = arith.constant true
      %8 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %9 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%8) {fallthrough = true} : (i32) -> ()
    ^bb1(%10: i32):  // no predecessors
      %c3_i32_2 = arith.constant 3 : i32
      %11 = arith.remsi %arg3, %c3_i32_2 : i32
      %12 = simt_step.lane_id
      %13 = arith.index_cast %12 : index to i32
      %14 = "simt_step.switch"(%11, %13) ({
      ^bb0(%arg5: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %24 = "simt_step.if"(%23) ({
          %true_13 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %33 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) : (i32) -> ()
        }, {
          %true_13 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %33 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb1(%25: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %32 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %33 = arith.addi %32, %c1_i32_13 : i32
          %34 = arith.cmpi slt, %arg7, %33 : i32
          "simt_step.condition"(%34, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_13 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32 = arith.constant 4 : i32
          %33 = arith.muli %arg7, %c4_i32 : i32
          %34 = arith.addi %c64_i32, %33 : i32
          %35 = arith.addi %34, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %35, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_14 = arith.constant 1 : i32
          %36 = arith.addi %arg7, %c1_i32_14 : i32
          "simt_step.break"(%32, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%27: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %32 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %33 = arith.addi %32, %c1_i32_13 : i32
          %34 = arith.cmpi slt, %arg7, %33 : i32
          "simt_step.condition"(%34, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_13 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32 = arith.constant 4 : i32
          %33 = arith.muli %arg7, %c4_i32 : i32
          %34 = arith.addi %c80_i32, %33 : i32
          %35 = arith.addi %34, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %35, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_14 = arith.constant 1 : i32
          %36 = arith.addi %arg7, %c1_i32_14 : i32
          "simt_step.yield"(%32, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%29: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %arg2, %c0_i32_12 : i32
        %31 = "simt_step.if"(%30) ({
          %true_13 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %33 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) : (i32) -> ()
        }, {
          %true_13 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %33 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb2(%15: i32):  // no predecessors
      %c3_i32_3 = arith.constant 3 : i32
      %16 = arith.remsi %arg3, %c3_i32_3 : i32
      %c1_i32 = arith.constant 1 : i32
      %17 = arith.addi %arg0, %c1_i32 : i32
      %18 = "simt_step.switch"(%16, %17) ({
      ^bb0(%arg5: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %36 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %37 = arith.addi %36, %c1_i32_11 : i32
          %38 = arith.cmpi slt, %arg7, %37 : i32
          "simt_step.condition"(%38, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_10 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %37 = arith.muli %arg7, %c4_i32_11 : i32
          %38 = arith.addi %c128_i32, %37 : i32
          %39 = arith.addi %38, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %39, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_12 = arith.constant 1 : i32
          %40 = arith.addi %arg7, %c1_i32_12 : i32
          "simt_step.yield"(%36, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%23#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%24: i32):  // no predecessors
        %25 = simt_step.subgroup_id
        %26 = arith.index_cast %25 : index to i32
        %27 = "simt_step.switch"(%arg3, %26) ({
        ^bb0(%arg6: i32):
          %true_10 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %37 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %true_11 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %40 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %40, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb2(%28: i32):  // no predecessors
        %c4_i32 = arith.constant 4 : i32
        %29 = arith.remsi %arg3, %c4_i32 : i32
        %30 = simt_step.subgroup_id
        %31 = arith.index_cast %30 : index to i32
        %32 = "simt_step.switch"(%29, %31) ({
        ^bb0(%arg6: i32):
          %true_10 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %37 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %true_11 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %40 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %40, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39) {fallthrough = true} : (i32) -> ()
        ^bb2(%41: i32):  // no predecessors
          %true_12 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %43 = arith.addi %c208_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %43, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        ^bb3(%44: i32):  // no predecessors
          %true_13 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c224_i32 = arith.constant 224 : i32
          %46 = arith.addi %c224_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %46, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      ^bb3(%33: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %35 = "simt_step.if"(%34) ({
          %true_10 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c240_i32 = arith.constant 240 : i32
          %37 = arith.addi %c240_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) : (i32) -> ()
        }, {
          %true_10 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c256_i32 = arith.constant 256 : i32
          %37 = arith.addi %c256_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      %c272_i32 = arith.constant 272 : i32
      %20 = arith.addi %c272_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb3(%21: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %22:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %23 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_7 = arith.constant 1 : i32
        %24 = arith.addi %23, %c1_i32_7 : i32
        %25 = arith.cmpi slt, %arg6, %24 : i32
        "simt_step.condition"(%25, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %true_7 = arith.constant true
        %23 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        %c288_i32 = arith.constant 288 : i32
        %c4_i32 = arith.constant 4 : i32
        %24 = arith.muli %arg6, %c4_i32 : i32
        %25 = arith.addi %c288_i32, %24 : i32
        %26 = arith.addi %25, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %26, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32_8 = arith.constant 1 : i32
        %27 = arith.addi %arg6, %c1_i32_8 : i32
        "simt_step.yield"(%23, %27) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%22#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %7 = arith.select %6, %0, %5 : i32
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
      %c8_i32 = arith.constant 8 : i32
      %14 = arith.addi %c8_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_2 : i32
      "simt_step.if"(%16) ({
        "simt_step.yield"() : () -> ()
      }, {
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %6 = simt_step.subgroup_id
    %7 = arith.index_cast %6 : index to i32
    %c12_i32 = arith.constant 12 : i32
    %8 = arith.addi %c12_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %10 = arith.cmpi ne, %9, %c0_i32_1 : i32
    %11 = "simt_step.if"(%10) ({
      %14 = simt_step.lane_id
      %15 = arith.index_cast %14 : index to i32
      "simt_step.yield"(%15) : (i32) -> ()
    }, {
      %c16_i32 = arith.constant 16 : i32
      %14 = arith.addi %c16_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_2 : i32
      %17 = "simt_step.if"(%16) ({
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %20:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_6 = arith.constant 4 : i32
          %21 = arith.muli %arg3, %c4_i32_6 : i32
          %22 = arith.addi %21, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %23 = arith.addi %c20_i32, %22 : i32
          %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_7 = arith.constant 0 : i32
          %25 = arith.cmpi ne, %24, %c0_i32_7 : i32
          "simt_step.condition"(%25, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %21 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %22 = arith.addi %arg3, %c1_i32 : i32
          %true_6 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %23 = arith.muli %arg3, %c4_i32_7 : i32
          %24 = arith.addi %c304_i32, %23 : i32
          %25 = arith.addi %24, %0 : i32
          %true_8 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21, %22) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%20#0) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %20:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_6 = arith.constant 4 : i32
          %21 = arith.muli %arg3, %c4_i32_6 : i32
          %22 = arith.addi %21, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %23 = arith.addi %c40_i32, %22 : i32
          %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_7 = arith.constant 0 : i32
          %25 = arith.cmpi ne, %24, %c0_i32_7 : i32
          "simt_step.condition"(%25, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %21 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %22 = arith.addi %arg3, %c1_i32 : i32
          %true_6 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %23 = arith.muli %arg3, %c4_i32_7 : i32
          %24 = arith.addi %c320_i32, %23 : i32
          %25 = arith.addi %24, %0 : i32
          %true_8 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21, %22) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%20#0) : (i32) -> ()
      }) : (i1) -> i32
      %c336_i32 = arith.constant 336 : i32
      %18 = arith.addi %c336_i32, %0 : i32
      %true_3 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17) : (i32) -> ()
    }) : (i1) -> i32
    %c352_i32 = arith.constant 352 : i32
    %12 = arith.addi %c352_i32, %0 : i32
    %true = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

