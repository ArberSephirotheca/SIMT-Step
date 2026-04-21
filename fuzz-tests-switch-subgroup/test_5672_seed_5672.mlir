module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %3 = "simt_step.if"(%2) ({
      %true_5 = arith.constant true
      %9 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %10 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %10, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%9) : (i32) -> ()
    }, {
      %true_5 = arith.constant true
      %9 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %10 = arith.addi %c32_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %10, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%9) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %5 = arith.select %4, %0, %3 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %9 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %10 = arith.addi %9, %c1_i32 : i32
      %11 = arith.cmpi slt, %arg5, %10 : i32
      "simt_step.condition"(%11, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c3_i32 = arith.constant 3 : i32
      %9 = arith.remsi %arg3, %c3_i32 : i32
      %10 = simt_step.subgroup_id
      %11 = arith.index_cast %10 : index to i32
      %12 = "simt_step.switch"(%9, %11) ({
      ^bb0(%arg6: i32):
        %true_5 = arith.constant true
        %14 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %c4_i32 = arith.constant 4 : i32
        %15 = arith.muli %arg5, %c4_i32 : i32
        %16 = arith.addi %c48_i32, %15 : i32
        %17 = arith.addi %16, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %17, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %19 = arith.remsi %arg3, %c2_i32 : i32
        %20 = simt_step.lane_id
        %21 = arith.index_cast %20 : index to i32
        %22 = "simt_step.switch"(%19, %21) ({
        ^bb0(%arg7: i32):
          %true_11 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %34 = arith.muli %arg5, %c4_i32_12 : i32
          %35 = arith.addi %c64_i32, %34 : i32
          %36 = arith.addi %35, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          %true_13 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %39 = arith.muli %arg5, %c4_i32_14 : i32
          %40 = arith.addi %c80_i32, %39 : i32
          %41 = arith.addi %40, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %41, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb2(%42: i32):  // no predecessors
          %true_15 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_16 : i32
          %45 = arith.addi %c96_i32, %44 : i32
          %46 = arith.addi %45, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %46, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb2(%23: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %25 = "simt_step.if"(%24) ({
          %true_11 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %34 = arith.muli %arg5, %c4_i32_12 : i32
          %35 = arith.addi %c112_i32, %34 : i32
          %36 = arith.addi %35, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) : (i32) -> ()
        }, {
          %true_11 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %34 = arith.muli %arg5, %c4_i32_12 : i32
          %35 = arith.addi %c128_i32, %34 : i32
          %36 = arith.addi %35, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb3(%26: i32):  // no predecessors
        %c2_i32_7 = arith.constant 2 : i32
        %27 = arith.remsi %arg3, %c2_i32_7 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %28 = "simt_step.switch"(%27, %c1_i32_8) ({
        ^bb0(%arg7: i32):
          %true_11 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %34 = arith.muli %arg5, %c4_i32_12 : i32
          %35 = arith.addi %c144_i32, %34 : i32
          %36 = arith.addi %35, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          %true_13 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %39 = arith.muli %arg5, %c4_i32_14 : i32
          %40 = arith.addi %c160_i32, %39 : i32
          %41 = arith.addi %40, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %41, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38) {fallthrough = true} : (i32) -> ()
        ^bb2(%42: i32):  // no predecessors
          %true_15 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_16 : i32
          %45 = arith.addi %c176_i32, %44 : i32
          %46 = arith.addi %45, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %46, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %c4_i32_10 = arith.constant 4 : i32
        %30 = arith.muli %arg5, %c4_i32_10 : i32
        %31 = arith.addi %c192_i32, %30 : i32
        %32 = arith.addi %31, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %32, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%12, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_4 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
    %8 = arith.select %7, %5, %6#0 : i32
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
      %12 = arith.addi %c8_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_2 : i32
      "simt_step.if"(%14) ({
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }, {
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_1 : i32
    %9 = "simt_step.if"(%8) ({
      %c16_i32 = arith.constant 16 : i32
      %12 = arith.addi %c16_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %14 = simt_step.subgroup_id
      %15 = arith.index_cast %14 : index to i32
      %16 = "simt_step.switch"(%13, %15) ({
      ^bb0(%arg2: i32):
        %19 = simt_step.subgroup_id
        %20 = arith.index_cast %19 : index to i32
        %true_4 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %21 = arith.addi %c208_i32, %0 : i32
        %true_5 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %24 = arith.addi %c20_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %26 = simt_step.lane_id
        %27 = arith.index_cast %26 : index to i32
        %28 = "simt_step.switch"(%25, %27) ({
        ^bb0(%arg3: i32):
          %c2_i32 = arith.constant 2 : i32
          %true_6 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %29 = arith.addi %c224_i32, %0 : i32
          %true_7 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%31: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%32: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %33 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      %c240_i32 = arith.constant 240 : i32
      %17 = arith.addi %c240_i32, %0 : i32
      %true_3 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16) : (i32) -> ()
    }, {
      %c24_i32 = arith.constant 24 : i32
      %12 = arith.addi %c24_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_2 : i32
      %15 = "simt_step.if"(%14) ({
        %c28_i32 = arith.constant 28 : i32
        %18 = arith.addi %c28_i32, %0 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %20 = "simt_step.switch"(%19, %0) ({
        ^bb0(%arg2: i32):
          %23 = simt_step.lane_id
          %24 = arith.index_cast %23 : index to i32
          %true_6 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %25 = arith.addi %c256_i32, %0 : i32
          %true_7 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %c0_i32_8 = arith.constant 0 : i32
          %28 = arith.addi %0, %c0_i32_8 : i32
          %true_9 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %29 = arith.addi %c272_i32, %0 : i32
          %true_10 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %c4_i32_11 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_11) {fallthrough = false} : (i32) -> ()
        ^bb3(%32: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %true_12 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %33 = arith.addi %c288_i32, %0 : i32
          %true_13 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_4 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %21 = arith.addi %c304_i32, %0 : i32
        %true_5 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20) : (i32) -> ()
      }, {
        %c32_i32 = arith.constant 32 : i32
        %18 = arith.addi %c32_i32, %0 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_4 : i32
        %21 = "simt_step.if"(%20) ({
          %24 = simt_step.subgroup_id
          %25 = arith.index_cast %24 : index to i32
          "simt_step.yield"(%25) : (i32) -> ()
        }, {
          %24 = simt_step.subgroup_id
          %25 = arith.index_cast %24 : index to i32
          "simt_step.yield"(%25) : (i32) -> ()
        }) : (i1) -> i32
        %c320_i32 = arith.constant 320 : i32
        %22 = arith.addi %c320_i32, %0 : i32
        %true_5 = arith.constant true
        %23 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21) : (i32) -> ()
      }) : (i1) -> i32
      %c336_i32 = arith.constant 336 : i32
      %16 = arith.addi %c336_i32, %0 : i32
      %true_3 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15) : (i32) -> ()
    }) : (i1) -> i32
    %c352_i32 = arith.constant 352 : i32
    %10 = arith.addi %c352_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

