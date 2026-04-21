module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.remsi %arg3, %c4_i32 : i32
    %1 = "simt_step.switch"(%0, %arg0) ({
    ^bb0(%arg4: i32):
      %true_0 = arith.constant true
      %4 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
      %c0_i32 = arith.constant 0 : i32
      %5 = arith.addi %c0_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%4) {fallthrough = false} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %7:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %14 = arith.remsi %arg3, %c4_i32_5 : i32
        %c1_i32 = arith.constant 1 : i32
        %15 = arith.addi %14, %c1_i32 : i32
        %16 = arith.cmpi slt, %arg6, %15 : i32
        "simt_step.condition"(%16, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %14 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %15 = "simt_step.if"(%14) ({
          %true_6 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %18 = arith.muli %arg6, %c4_i32_7 : i32
          %19 = arith.addi %c16_i32, %18 : i32
          %20 = arith.addi %19, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) : (i32) -> ()
        }, {
          %true_6 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %18 = arith.muli %arg6, %c4_i32_7 : i32
          %19 = arith.addi %c32_i32, %18 : i32
          %20 = arith.addi %19, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32 = arith.constant 1 : i32
        %16 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%15, %16) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%7#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%8: i32):  // no predecessors
      %true_3 = arith.constant true
      %9 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      %c48_i32 = arith.constant 48 : i32
      %10 = arith.addi %c48_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %10, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    ^bb3(%11: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
      %13 = "simt_step.if"(%12) ({
        %true_5 = arith.constant true
        %14 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %15 = arith.addi %c64_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%14) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        %14 = arith.remsi %arg3, %c2_i32 : i32
        %15 = simt_step.lane_id
        %16 = arith.index_cast %15 : index to i32
        %17 = "simt_step.switch"(%14, %16) ({
        ^bb0(%arg5: i32):
          %true_6 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %21 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb1(%22: i32):  // no predecessors
          %true_7 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %24 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        %18 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %19 = arith.addi %c112_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%17) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c128_i32 = arith.constant 128 : i32
    %3 = arith.addi %c128_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
      %c8_i32 = arith.constant 8 : i32
      %12 = arith.addi %c8_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_2 : i32
      "simt_step.if"(%14) ({
        "simt_step.yield"() : () -> ()
      }, {
        %15 = "simt_step.switch"(%0, %0) ({
        ^bb0(%arg2: i32):
          %c2_i32 = arith.constant 2 : i32
          %16 = arith.addi %arg2, %c2_i32 : i32
          "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
        ^bb1(%17: i32):  // no predecessors
          %c0_i32_3 = arith.constant 0 : i32
          %18 = arith.addi %17, %c0_i32_3 : i32
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
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
      %14 = simt_step.lane_id
      %15 = arith.index_cast %14 : index to i32
      %16 = "simt_step.switch"(%13, %15) ({
      ^bb0(%arg2: i32):
        %c20_i32 = arith.constant 20 : i32
        %17 = arith.addi %c20_i32, %0 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %19 = "simt_step.switch"(%18, %c1_i32) ({
        ^bb0(%arg3: i32):
          %c0_i32_6 = arith.constant 0 : i32
          %true_7 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %29 = arith.addi %c144_i32, %0 : i32
          %true_8 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_6) {fallthrough = true} : (i32) -> ()
        ^bb1(%31: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%32: i32):  // no predecessors
          %33 = simt_step.lane_id
          %34 = arith.index_cast %33 : index to i32
          %true_9 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %35 = arith.addi %c160_i32, %0 : i32
          %true_10 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_2 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %20 = arith.addi %c176_i32, %0 : i32
        %true_3 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      ^bb1(%22: i32):  // no predecessors
        %c24_i32 = arith.constant 24 : i32
        %23 = arith.addi %c24_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_4 : i32
        %26 = "simt_step.if"(%25) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %29 = simt_step.subgroup_id
          %30 = arith.index_cast %29 : index to i32
          "simt_step.yield"(%30) : (i32) -> ()
        }) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %27 = arith.addi %c192_i32, %0 : i32
        %true_5 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%16) : (i32) -> ()
    }, {
      %c28_i32 = arith.constant 28 : i32
      %12 = arith.addi %c28_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %14 = simt_step.subgroup_id
      %15 = arith.index_cast %14 : index to i32
      %16 = "simt_step.switch"(%13, %15) ({
      ^bb0(%arg2: i32):
        %c32_i32 = arith.constant 32 : i32
        %17 = arith.addi %c32_i32, %0 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %18, %c0_i32_2 : i32
        %20 = "simt_step.if"(%19) ({
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %47 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%47) : (i32) -> ()
        }) : (i1) -> i32
        %c208_i32 = arith.constant 208 : i32
        %21 = arith.addi %c208_i32, %0 : i32
        %true_3 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %24 = arith.addi %c36_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_4 : i32
        %27 = "simt_step.if"(%26) ({
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%47) : (i32) -> ()
        }, {
          %47 = simt_step.subgroup_id
          %48 = arith.index_cast %47 : index to i32
          "simt_step.yield"(%48) : (i32) -> ()
        }) : (i1) -> i32
        %c224_i32 = arith.constant 224 : i32
        %28 = arith.addi %c224_i32, %0 : i32
        %true_5 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb2(%30: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %31 = arith.addi %c40_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_6 : i32
        %34 = "simt_step.if"(%33) ({
          %c3_i32 = arith.constant 3 : i32
          %47 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%47) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c240_i32 = arith.constant 240 : i32
        %35 = arith.addi %c240_i32, %0 : i32
        %true_7 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      ^bb3(%37: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %38 = arith.addi %c44_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %40 = simt_step.lane_id
        %41 = arith.index_cast %40 : index to i32
        %42 = "simt_step.switch"(%39, %41) ({
        ^bb0(%arg3: i32):
          %47 = simt_step.lane_id
          %48 = arith.index_cast %47 : index to i32
          %true_12 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %49 = arith.addi %c256_i32, %0 : i32
          %true_13 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        ^bb1(%51: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %43 = arith.addi %c272_i32, %0 : i32
        %true_9 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_10 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %45 = arith.addi %c288_i32, %0 : i32
        %true_11 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%16) : (i32) -> ()
    }) : (i1) -> i32
    %c304_i32 = arith.constant 304 : i32
    %10 = arith.addi %c304_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

