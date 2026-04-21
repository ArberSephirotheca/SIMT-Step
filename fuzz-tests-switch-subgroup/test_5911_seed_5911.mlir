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
      %c3_i32 = arith.constant 3 : i32
      %6 = arith.remsi %arg3, %c3_i32 : i32
      %7 = simt_step.lane_id
      %8 = arith.index_cast %7 : index to i32
      %9 = "simt_step.switch"(%6, %8) ({
      ^bb0(%arg4: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %10:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %17 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %18 = arith.addi %17, %c1_i32 : i32
          %19 = arith.cmpi slt, %arg6, %18 : i32
          "simt_step.condition"(%19, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_6 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %18 = arith.muli %arg6, %c4_i32 : i32
          %19 = arith.addi %c16_i32, %18 : i32
          %20 = arith.addi %19, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%17, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%10#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%11: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %12 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %13 = "simt_step.if"(%12) ({
          %true_6 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %18 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) : (i32) -> ()
        }, {
          %true_6 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %18 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      ^bb2(%14: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %16 = "simt_step.if"(%15) ({
          %true_6 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %18 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) : (i32) -> ()
        }, {
          %true_6 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %18 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%9) : (i32) -> ()
    }, {
      %c2_i32 = arith.constant 2 : i32
      %6 = arith.remsi %arg3, %c2_i32 : i32
      %7 = simt_step.subgroup_id
      %8 = arith.index_cast %7 : index to i32
      %9 = "simt_step.switch"(%6, %8) ({
      ^bb0(%arg4: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %10 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %11 = "simt_step.if"(%10) ({
          %true_5 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %19 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) : (i32) -> ()
        }, {
          %true_5 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %19 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
      ^bb1(%12: i32):  // no predecessors
        %true_3 = arith.constant true
        %13 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %14 = arith.addi %c128_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      ^bb2(%15: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %17 = "simt_step.if"(%16) ({
          %true_5 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %19 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) : (i32) -> ()
        }, {
          %true_5 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %19 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%9) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %5 = arith.select %4, %0, %3 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.addi %0, %c0_i32_0 : i32
    %8 = "simt_step.switch"(%6, %7) ({
    ^bb0(%arg2: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_5 : i32
        %23 = arith.addi %22, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %24 = arith.addi %c12_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_6 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c32_i32 = arith.constant 32 : i32
        %22 = arith.addi %c32_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_5 : i32
        %25 = "simt_step.if"(%24) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %26 = arith.addi %c176_i32, %0 : i32
        %true_6 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %28 = arith.addi %arg3, %25 : i32
        %c1_i32 = arith.constant 1 : i32
        %29 = arith.addi %arg4, %c1_i32 : i32
        %true_7 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_8 : i32
        %31 = arith.addi %c192_i32, %30 : i32
        %32 = arith.addi %31, %0 : i32
        %true_9 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%28, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true = arith.constant true
      %c208_i32 = arith.constant 208 : i32
      %15 = arith.addi %c208_i32, %0 : i32
      %true_3 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c4_i32_4 = arith.constant 4 : i32
      %18 = arith.addi %0, %c4_i32_4 : i32
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb2(%19: i32):  // no predecessors
      %20 = simt_step.subgroup_id
      %21 = arith.index_cast %20 : index to i32
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %c36_i32 = arith.constant 36 : i32
    %9 = arith.addi %c36_i32, %0 : i32
    %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
    %11 = simt_step.lane_id
    %12 = arith.index_cast %11 : index to i32
    %13 = "simt_step.switch"(%10, %12) ({
    ^bb0(%arg2: i32):
      %c40_i32 = arith.constant 40 : i32
      %14 = arith.addi %c40_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_1 : i32
      %17 = "simt_step.if"(%16) ({
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %38 = arith.muli %arg4, %c4_i32_13 : i32
          %39 = arith.addi %38, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %40 = arith.addi %c44_i32, %39 : i32
          %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %42 = arith.cmpi ne, %41, %c0_i32_14 : i32
          "simt_step.condition"(%42, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %38 = arith.addi %arg3, %arg4 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %39 = arith.addi %arg4, %c1_i32_13 : i32
          %true_14 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %40 = arith.muli %arg4, %c4_i32_15 : i32
          %41 = arith.addi %c224_i32, %40 : i32
          %42 = arith.addi %41, %0 : i32
          %true_16 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%37#0) : (i32) -> ()
      }, {
        %c64_i32 = arith.constant 64 : i32
        %37 = arith.addi %c64_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_11 : i32
        %40 = "simt_step.if"(%39) ({
          %43 = simt_step.lane_id
          %44 = arith.index_cast %43 : index to i32
          "simt_step.yield"(%44) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %43 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%43) : (i32) -> ()
        }) : (i1) -> i32
        %c240_i32 = arith.constant 240 : i32
        %41 = arith.addi %c240_i32, %0 : i32
        %true_12 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) : (i32) -> ()
      }) : (i1) -> i32
      %c256_i32 = arith.constant 256 : i32
      %18 = arith.addi %c256_i32, %0 : i32
      %true = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb1(%20: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %21 = arith.addi %c68_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %23 = arith.addi %0, %c1_i32 : i32
      %24 = "simt_step.switch"(%22, %23) ({
      ^bb0(%arg3: i32):
        %c72_i32 = arith.constant 72 : i32
        %37 = arith.addi %c72_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %39 = "simt_step.switch"(%38, %c2_i32) ({
        ^bb0(%arg4: i32):
          %49 = simt_step.subgroup_id
          %50 = arith.index_cast %49 : index to i32
          %true_15 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %51 = arith.addi %c272_i32, %0 : i32
          %true_16 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%50) {fallthrough = true} : (i32) -> ()
        ^bb1(%53: i32):  // no predecessors
          %true_17 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %54 = arith.addi %c288_i32, %0 : i32
          %true_18 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%56: i32):  // no predecessors
          %57 = simt_step.lane_id
          %58 = arith.index_cast %57 : index to i32
          %true_19 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %59 = arith.addi %c304_i32, %0 : i32
          %true_20 = arith.constant true
          %60 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%58) {fallthrough = true} : (i32) -> ()
        ^bb3(%61: i32):  // no predecessors
          %c0_i32_21 = arith.constant 0 : i32
          %62 = arith.addi %0, %c0_i32_21 : i32
          "simt_step.yield"(%62) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      ^bb1(%40: i32):  // no predecessors
        %c76_i32 = arith.constant 76 : i32
        %41 = arith.addi %c76_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_11 : i32
        %44 = "simt_step.if"(%43) ({
          %c4_i32_15 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_15) : (i32) -> ()
        }, {
          %c2_i32_15 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_15) : (i32) -> ()
        }) : (i1) -> i32
        %c320_i32 = arith.constant 320 : i32
        %45 = arith.addi %c320_i32, %0 : i32
        %true_12 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_13 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %47 = arith.addi %c336_i32, %0 : i32
        %true_14 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      %c352_i32 = arith.constant 352 : i32
      %25 = arith.addi %c352_i32, %0 : i32
      %true_3 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_4 = arith.constant true
      %c368_i32 = arith.constant 368 : i32
      %27 = arith.addi %c368_i32, %0 : i32
      %true_5 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb2(%29: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %30:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %37 = arith.muli %arg4, %c4_i32_11 : i32
        %38 = arith.addi %37, %0 : i32
        %c80_i32 = arith.constant 80 : i32
        %39 = arith.addi %c80_i32, %38 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_12 : i32
        "simt_step.condition"(%41, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %37 = arith.addi %arg3, %arg4 : i32
        %c1_i32_11 = arith.constant 1 : i32
        %38 = arith.addi %arg4, %c1_i32_11 : i32
        %true_12 = arith.constant true
        %c384_i32 = arith.constant 384 : i32
        %c4_i32_13 = arith.constant 4 : i32
        %39 = arith.muli %arg4, %c4_i32_13 : i32
        %40 = arith.addi %c384_i32, %39 : i32
        %41 = arith.addi %40, %0 : i32
        %true_14 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37, %38) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      %c400_i32 = arith.constant 400 : i32
      %31 = arith.addi %c400_i32, %0 : i32
      %true_9 = arith.constant true
      %32 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%33: i32):  // no predecessors
      %c100_i32 = arith.constant 100 : i32
      %34 = arith.addi %c100_i32, %0 : i32
      %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_10 = arith.constant 4 : i32
      %36 = "simt_step.switch"(%35, %c4_i32_10) ({
      ^bb0(%arg3: i32):
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %50 = arith.muli %arg5, %c4_i32_19 : i32
          %51 = arith.addi %50, %0 : i32
          %c104_i32 = arith.constant 104 : i32
          %52 = arith.addi %c104_i32, %51 : i32
          %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %54 = arith.cmpi ne, %53, %c0_i32_20 : i32
          "simt_step.condition"(%54, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %50 = arith.addi %arg4, %arg5 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %51 = arith.addi %arg5, %c1_i32_19 : i32
          %true_20 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %52 = arith.muli %arg5, %c4_i32_21 : i32
          %53 = arith.addi %c416_i32, %52 : i32
          %54 = arith.addi %53, %0 : i32
          %true_22 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%50, %51) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%37#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %true_13 = arith.constant true
        %c432_i32 = arith.constant 432 : i32
        %39 = arith.addi %c432_i32, %0 : i32
        %true_14 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
      ^bb2(%41: i32):  // no predecessors
        %c124_i32 = arith.constant 124 : i32
        %42 = arith.addi %c124_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %44 = arith.cmpi ne, %43, %c0_i32_15 : i32
        %45 = "simt_step.if"(%44) ({
          %50 = simt_step.subgroup_id
          %51 = arith.index_cast %50 : index to i32
          "simt_step.yield"(%51) : (i32) -> ()
        }, {
          %50 = simt_step.subgroup_id
          %51 = arith.index_cast %50 : index to i32
          "simt_step.yield"(%51) : (i32) -> ()
        }) : (i1) -> i32
        %c448_i32 = arith.constant 448 : i32
        %46 = arith.addi %c448_i32, %0 : i32
        %true_16 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_17 = arith.constant true
        %c464_i32 = arith.constant 464 : i32
        %48 = arith.addi %c464_i32, %0 : i32
        %true_18 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

