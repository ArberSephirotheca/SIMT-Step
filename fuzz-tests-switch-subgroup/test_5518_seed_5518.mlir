module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %4 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %5 = arith.addi %4, %c1_i32 : i32
      %6 = arith.cmpi slt, %arg5, %5 : i32
      "simt_step.condition"(%6, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true = arith.constant true
      %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %c4_i32 = arith.constant 4 : i32
      %5 = arith.muli %arg5, %c4_i32 : i32
      %6 = arith.addi %c0_i32_4, %5 : i32
      %7 = arith.addi %6, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %8 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%4, %8) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %1:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %4 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %5 = arith.addi %4, %c1_i32 : i32
      %6 = arith.cmpi slt, %arg5, %5 : i32
      "simt_step.condition"(%6, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c3_i32 = arith.constant 3 : i32
      %4 = arith.remsi %arg3, %c3_i32 : i32
      %c4_i32 = arith.constant 4 : i32
      %5 = "simt_step.switch"(%4, %c4_i32) ({
      ^bb0(%arg6: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %7 = arith.remsi %arg3, %c4_i32_4 : i32
        %c3_i32_5 = arith.constant 3 : i32
        %8 = "simt_step.switch"(%7, %c3_i32_5) ({
        ^bb0(%arg7: i32):
          %true_8 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %22 = arith.muli %arg5, %c4_i32_9 : i32
          %23 = arith.addi %c16_i32, %22 : i32
          %24 = arith.addi %23, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %true_10 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %27 = arith.muli %arg5, %c4_i32_11 : i32
          %28 = arith.addi %c32_i32, %27 : i32
          %29 = arith.addi %28, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb2(%30: i32):  // no predecessors
          %true_12 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %32 = arith.muli %arg5, %c4_i32_13 : i32
          %33 = arith.addi %c48_i32, %32 : i32
          %34 = arith.addi %33, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) {fallthrough = true} : (i32) -> ()
        ^bb3(%35: i32):  // no predecessors
          %true_14 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %37 = arith.muli %arg5, %c4_i32_15 : i32
          %38 = arith.addi %c64_i32, %37 : i32
          %39 = arith.addi %38, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %39, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        %9 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %c4_i32_6 = arith.constant 4 : i32
        %10 = arith.muli %arg5, %c4_i32_6 : i32
        %11 = arith.addi %c80_i32, %10 : i32
        %12 = arith.addi %11, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
      ^bb1(%13: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %14 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %15 = "simt_step.if"(%14) ({
          %true_8 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %22 = arith.muli %arg5, %c4_i32_9 : i32
          %23 = arith.addi %c96_i32, %22 : i32
          %24 = arith.addi %23, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) : (i32) -> ()
        }, {
          %true_8 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %22 = arith.muli %arg5, %c4_i32_9 : i32
          %23 = arith.addi %c112_i32, %22 : i32
          %24 = arith.addi %23, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
      ^bb2(%16: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %17 = arith.remsi %arg3, %c2_i32 : i32
        %18 = simt_step.subgroup_id
        %19 = arith.index_cast %18 : index to i32
        %20 = "simt_step.switch"(%17, %19) ({
        ^bb0(%arg7: i32):
          %true_8 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %22 = arith.muli %arg5, %c4_i32_9 : i32
          %23 = arith.addi %c128_i32, %22 : i32
          %24 = arith.addi %23, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %true_10 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %27 = arith.muli %arg5, %c4_i32_11 : i32
          %28 = arith.addi %c144_i32, %27 : i32
          %29 = arith.addi %28, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%5, %6) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_3 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
    %3 = arith.select %2, %0#0, %1#0 : i32
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
    %c2_i32 = arith.constant 2 : i32
    %7 = arith.addi %0, %c2_i32 : i32
    %8 = "simt_step.switch"(%6, %7) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %15 = arith.addi %c12_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %17 = simt_step.subgroup_id
      %18 = arith.index_cast %17 : index to i32
      %19 = "simt_step.switch"(%16, %18) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %34 = arith.addi %c16_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_7 : i32
        %37 = "simt_step.if"(%36) ({
          %53 = simt_step.lane_id
          %54 = arith.index_cast %53 : index to i32
          "simt_step.yield"(%54) : (i32) -> ()
        }, {
          %53 = simt_step.lane_id
          %54 = arith.index_cast %53 : index to i32
          "simt_step.yield"(%54) : (i32) -> ()
        }) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %38 = arith.addi %c160_i32, %0 : i32
        %true_8 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_9 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %40 = arith.addi %c176_i32, %0 : i32
        %true_10 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37) {fallthrough = true} : (i32) -> ()
      ^bb1(%42: i32):  // no predecessors
        %c4_i32_11 = arith.constant 4 : i32
        %43 = arith.addi %0, %c4_i32_11 : i32
        "simt_step.yield"(%43) {fallthrough = true} : (i32) -> ()
      ^bb2(%44: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %45 = arith.addi %c20_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %47 = arith.cmpi ne, %46, %c0_i32_12 : i32
        %48 = "simt_step.if"(%47) ({
          %53 = simt_step.lane_id
          %54 = arith.index_cast %53 : index to i32
          "simt_step.yield"(%54) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %49 = arith.addi %c192_i32, %0 : i32
        %true_13 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_14 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %51 = arith.addi %c208_i32, %0 : i32
        %true_15 = arith.constant true
        %52 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c224_i32 = arith.constant 224 : i32
      %20 = arith.addi %c224_i32, %0 : i32
      %true_2 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %23 = simt_step.lane_id
      %24 = arith.index_cast %23 : index to i32
      %true_3 = arith.constant true
      %c240_i32 = arith.constant 240 : i32
      %25 = arith.addi %c240_i32, %0 : i32
      %true_4 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb2(%27: i32):  // no predecessors
      %c24_i32 = arith.constant 24 : i32
      %28 = arith.addi %c24_i32, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %30 = arith.cmpi ne, %29, %c0_i32_5 : i32
      %31 = "simt_step.if"(%30) ({
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_9 : i32
          %36 = arith.addi %35, %0 : i32
          %c28_i32 = arith.constant 28 : i32
          %37 = arith.addi %c28_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_10 : i32
          "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %35 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %arg4, %c1_i32 : i32
          %true_9 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %37 = arith.muli %arg4, %c4_i32_10 : i32
          %38 = arith.addi %c256_i32, %37 : i32
          %39 = arith.addi %38, %0 : i32
          %true_11 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%34#0) : (i32) -> ()
      }, {
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32) : (i32) -> ()
      }) : (i1) -> i32
      %c272_i32 = arith.constant 272 : i32
      %32 = arith.addi %c272_i32, %0 : i32
      %true_6 = arith.constant true
      %33 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %9:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_2 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_2 : i32
      %16 = arith.addi %15, %0 : i32
      %c48_i32 = arith.constant 48 : i32
      %17 = arith.addi %c48_i32, %16 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_3 : i32
      "simt_step.condition"(%19, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %15 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %16 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %c4_i32_2 = arith.constant 4 : i32
      %17 = arith.muli %arg3, %c4_i32_2 : i32
      %18 = arith.addi %c288_i32, %17 : i32
      %19 = arith.addi %18, %0 : i32
      %true_3 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15, %16) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c68_i32 = arith.constant 68 : i32
    %10 = arith.addi %c68_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %12 = simt_step.lane_id
    %13 = arith.index_cast %12 : index to i32
    %14 = "simt_step.switch"(%11, %13) ({
    ^bb0(%arg2: i32):
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %0, %c1_i32 : i32
      %true = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %16 = arith.addi %c304_i32, %0 : i32
      %true_2 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c72_i32 = arith.constant 72 : i32
      %19 = arith.addi %c72_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %21 = simt_step.subgroup_id
      %22 = arith.index_cast %21 : index to i32
      %23 = "simt_step.switch"(%20, %22) ({
      ^bb0(%arg3: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_13 : i32
          %45 = arith.addi %44, %0 : i32
          %c76_i32 = arith.constant 76 : i32
          %46 = arith.addi %c76_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_14 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32_13 : i32
          %true_14 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_15 : i32
          %47 = arith.addi %c320_i32, %46 : i32
          %48 = arith.addi %47, %0 : i32
          %true_16 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%29#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c96_i32 = arith.constant 96 : i32
        %31 = arith.addi %c96_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_7 : i32
        %34 = "simt_step.if"(%33) ({
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) : (i32) -> ()
        }, {
          %c2_i32_13 = arith.constant 2 : i32
          %44 = arith.addi %0, %c2_i32_13 : i32
          "simt_step.yield"(%44) : (i32) -> ()
        }) : (i1) -> i32
        %c336_i32 = arith.constant 336 : i32
        %35 = arith.addi %c336_i32, %0 : i32
        %true_8 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34) {fallthrough = true} : (i32) -> ()
      ^bb2(%37: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %38:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_13 : i32
          %45 = arith.addi %44, %0 : i32
          %c100_i32 = arith.constant 100 : i32
          %46 = arith.addi %c100_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_14 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32_13 : i32
          %true_14 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_15 : i32
          %47 = arith.addi %c352_i32, %46 : i32
          %48 = arith.addi %47, %0 : i32
          %true_16 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%38#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%39: i32):  // no predecessors
        %40 = simt_step.subgroup_id
        %41 = arith.index_cast %40 : index to i32
        %true_11 = arith.constant true
        %c368_i32 = arith.constant 368 : i32
        %42 = arith.addi %c368_i32, %0 : i32
        %true_12 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb2(%24: i32):  // no predecessors
      %25 = simt_step.subgroup_id
      %26 = arith.index_cast %25 : index to i32
      %true_3 = arith.constant true
      %c384_i32 = arith.constant 384 : i32
      %27 = arith.addi %c384_i32, %0 : i32
      %true_4 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    return
  }
}

