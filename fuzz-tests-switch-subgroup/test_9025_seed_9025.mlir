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
      %9 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %10 = arith.addi %9, %c1_i32 : i32
      %11 = arith.cmpi slt, %arg5, %10 : i32
      "simt_step.condition"(%11, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c3_i32 = arith.constant 3 : i32
      %9 = arith.remsi %arg3, %c3_i32 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %10 = "simt_step.switch"(%9, %c0_i32_5) ({
      ^bb0(%arg6: i32):
        %true_6 = arith.constant true
        %12 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %c4_i32 = arith.constant 4 : i32
        %13 = arith.muli %arg5, %c4_i32 : i32
        %14 = arith.addi %c16_i32, %13 : i32
        %15 = arith.addi %14, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      ^bb1(%16: i32):  // no predecessors
        %true_7 = arith.constant true
        %17 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %18 = arith.muli %arg5, %c4_i32_8 : i32
        %19 = arith.addi %c32_i32, %18 : i32
        %20 = arith.addi %19, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %20, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      ^bb2(%21: i32):  // no predecessors
        %true_9 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %c4_i32_10 = arith.constant 4 : i32
        %23 = arith.muli %arg5, %c4_i32_10 : i32
        %24 = arith.addi %c48_i32, %23 : i32
        %25 = arith.addi %24, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.continue"(%10, %11) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %0, %2#0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
    %6 = "simt_step.if"(%5) ({
      %true_5 = arith.constant true
      %9 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      %c64_i32 = arith.constant 64 : i32
      %10 = arith.addi %c64_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %10, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%9) : (i32) -> ()
    }, {
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %9:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %10 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %11 = arith.addi %10, %c1_i32 : i32
        %12 = arith.cmpi slt, %arg5, %11 : i32
        "simt_step.condition"(%12, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %true_7 = arith.constant true
        %10 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %c4_i32 = arith.constant 4 : i32
        %11 = arith.muli %arg5, %c4_i32 : i32
        %12 = arith.addi %c80_i32, %11 : i32
        %13 = arith.addi %12, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%10, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%9#0) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_4 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
    %8 = arith.select %7, %4, %6 : i32
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
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c2_i32 = arith.constant 2 : i32
        %16 = arith.cmpi slt, %arg3, %c2_i32 : i32
        "simt_step.condition"(%16, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32_6 = arith.constant 1 : i32
        %16 = arith.addi %arg3, %c1_i32_6 : i32
        "simt_step.yield"(%arg2, %16) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = "simt_step.switch"(%7, %0) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %15 = arith.addi %c12_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %17 = simt_step.lane_id
      %18 = arith.index_cast %17 : index to i32
      %19 = "simt_step.switch"(%16, %18) ({
      ^bb0(%arg3: i32):
        %c2_i32 = arith.constant 2 : i32
        %28 = arith.addi %0, %c2_i32 : i32
        %true_12 = arith.constant true
        %c96_i32 = arith.constant 96 : i32
        %29 = arith.addi %c96_i32, %0 : i32
        %true_13 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c16_i32 = arith.constant 16 : i32
        %32 = arith.addi %c16_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %34 = "simt_step.switch"(%33, %c3_i32) ({
        ^bb0(%arg4: i32):
          %44 = simt_step.lane_id
          %45 = arith.index_cast %44 : index to i32
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          %c3_i32_18 = arith.constant 3 : i32
          %47 = arith.addi %0, %c3_i32_18 : i32
          %true_19 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %48 = arith.addi %c112_i32, %0 : i32
          %true_20 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %35 = arith.addi %c128_i32, %0 : i32
        %true_15 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      ^bb2(%37: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %38 = arith.addi %c20_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_16 : i32
        %41 = "simt_step.if"(%40) ({
          %c0_i32_18 = arith.constant 0 : i32
          %44 = arith.addi %0, %c0_i32_18 : i32
          "simt_step.yield"(%44) : (i32) -> ()
        }, {
          %c2_i32_18 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_18) : (i32) -> ()
        }) : (i1) -> i32
        %c144_i32 = arith.constant 144 : i32
        %42 = arith.addi %c144_i32, %0 : i32
        %true_17 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %c160_i32 = arith.constant 160 : i32
      %20 = arith.addi %c160_i32, %0 : i32
      %true_5 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_12 : i32
        %29 = arith.addi %28, %0 : i32
        %c24_i32 = arith.constant 24 : i32
        %30 = arith.addi %c24_i32, %29 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_13 : i32
        "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %28 = simt_step.subgroup_id
        %29 = arith.index_cast %28 : index to i32
        %30 = arith.addi %arg3, %29 : i32
        %c1_i32_12 = arith.constant 1 : i32
        %31 = arith.addi %arg4, %c1_i32_12 : i32
        %true_13 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %c4_i32_14 = arith.constant 4 : i32
        %32 = arith.muli %arg4, %c4_i32_14 : i32
        %33 = arith.addi %c176_i32, %32 : i32
        %34 = arith.addi %33, %0 : i32
        %true_15 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%30, %31) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      %c192_i32 = arith.constant 192 : i32
      %24 = arith.addi %c192_i32, %0 : i32
      %true_9 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%23#0) {fallthrough = true} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      %c0_i32_10 = arith.constant 0 : i32
      %c0_i32_11 = arith.constant 0 : i32
      %27:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_12 : i32
        %29 = arith.addi %28, %0 : i32
        %c44_i32 = arith.constant 44 : i32
        %30 = arith.addi %c44_i32, %29 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_13 : i32
        "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c64_i32 = arith.constant 64 : i32
        %28 = arith.addi %c64_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %30 = simt_step.subgroup_id
        %31 = arith.index_cast %30 : index to i32
        %32 = "simt_step.switch"(%29, %31) ({
        ^bb0(%arg5: i32):
          %39 = simt_step.lane_id
          %40 = arith.index_cast %39 : index to i32
          %true_16 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %41 = arith.addi %c208_i32, %0 : i32
          %true_17 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%44: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %33 = arith.addi %arg3, %32 : i32
        %c1_i32_12 = arith.constant 1 : i32
        %34 = arith.addi %arg4, %c1_i32_12 : i32
        %true_13 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %c4_i32_14 = arith.constant 4 : i32
        %35 = arith.muli %arg4, %c4_i32_14 : i32
        %36 = arith.addi %c224_i32, %35 : i32
        %37 = arith.addi %36, %0 : i32
        %true_15 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%33, %34) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%27#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c240_i32 = arith.constant 240 : i32
    %9 = arith.addi %c240_i32, %0 : i32
    %true_1 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %11:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_4 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_4 : i32
      %16 = arith.addi %15, %0 : i32
      %c68_i32 = arith.constant 68 : i32
      %17 = arith.addi %c68_i32, %16 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_5 : i32
      "simt_step.condition"(%19, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %15 = simt_step.lane_id
      %16 = arith.index_cast %15 : index to i32
      %17 = arith.addi %arg2, %16 : i32
      %c1_i32_4 = arith.constant 1 : i32
      %18 = arith.addi %arg3, %c1_i32_4 : i32
      %true_5 = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %19 = arith.muli %arg3, %c4_i32_6 : i32
      %20 = arith.addi %c256_i32, %19 : i32
      %21 = arith.addi %20, %0 : i32
      %true_7 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%17, %18) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c88_i32 = arith.constant 88 : i32
    %12 = arith.addi %c88_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %14 = "simt_step.switch"(%13, %c1_i32) ({
    ^bb0(%arg2: i32):
      %c92_i32 = arith.constant 92 : i32
      %15 = arith.addi %c92_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %17 = "simt_step.switch"(%16, %c2_i32) ({
      ^bb0(%arg3: i32):
        %c96_i32 = arith.constant 96 : i32
        %26 = arith.addi %c96_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %28 = simt_step.subgroup_id
        %29 = arith.index_cast %28 : index to i32
        %30 = "simt_step.switch"(%27, %29) ({
        ^bb0(%arg4: i32):
          %48 = simt_step.lane_id
          %49 = arith.index_cast %48 : index to i32
          %true_17 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %50 = arith.addi %c272_i32, %0 : i32
          %true_18 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%49) {fallthrough = true} : (i32) -> ()
        ^bb1(%52: i32):  // no predecessors
          %c4_i32_19 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_19) {fallthrough = true} : (i32) -> ()
        ^bb2(%53: i32):  // no predecessors
          %c4_i32_20 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_20) {fallthrough = true} : (i32) -> ()
        ^bb3(%54: i32):  // no predecessors
          %true_21 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %55 = arith.addi %c288_i32, %0 : i32
          %true_22 = arith.constant true
          %56 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %31 = arith.addi %c304_i32, %0 : i32
        %true_9 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      ^bb1(%33: i32):  // no predecessors
        %c100_i32 = arith.constant 100 : i32
        %34 = arith.addi %c100_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_10 : i32
        %37 = "simt_step.if"(%36) ({
          %c0_i32_17 = arith.constant 0 : i32
          %48 = arith.addi %0, %c0_i32_17 : i32
          "simt_step.yield"(%48) : (i32) -> ()
        }, {
          %c0_i32_17 = arith.constant 0 : i32
          %48 = arith.addi %0, %c0_i32_17 : i32
          "simt_step.yield"(%48) : (i32) -> ()
        }) : (i1) -> i32
        %c320_i32 = arith.constant 320 : i32
        %38 = arith.addi %c320_i32, %0 : i32
        %true_11 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_12 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %40 = arith.addi %c336_i32, %0 : i32
        %true_13 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb2(%42: i32):  // no predecessors
        %c104_i32 = arith.constant 104 : i32
        %43 = arith.addi %c104_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_14 = arith.constant 4 : i32
        %45 = "simt_step.switch"(%44, %c4_i32_14) ({
        ^bb0(%arg4: i32):
          %c0_i32_17 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_17) {fallthrough = false} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          %49 = simt_step.subgroup_id
          %50 = arith.index_cast %49 : index to i32
          %true_18 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %51 = arith.addi %c352_i32, %0 : i32
          %true_19 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        %c368_i32 = arith.constant 368 : i32
        %46 = arith.addi %c368_i32, %0 : i32
        %true_16 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c108_i32 = arith.constant 108 : i32
      %19 = arith.addi %c108_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %21 = "simt_step.switch"(%20, %c3_i32) ({
      ^bb0(%arg3: i32):
        %c112_i32 = arith.constant 112 : i32
        %26 = arith.addi %c112_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_8 = arith.constant 4 : i32
        %28 = "simt_step.switch"(%27, %c4_i32_8) ({
        ^bb0(%arg4: i32):
          %44 = simt_step.lane_id
          %45 = arith.index_cast %44 : index to i32
          %true_15 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %46 = arith.addi %c384_i32, %0 : i32
          %true_16 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %29 = arith.addi %c400_i32, %0 : i32
        %true_10 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %32 = simt_step.lane_id
        %33 = arith.index_cast %32 : index to i32
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb2(%34: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_15 : i32
          %45 = arith.addi %44, %0 : i32
          %c116_i32 = arith.constant 116 : i32
          %46 = arith.addi %c116_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_16 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32_15 : i32
          %true_16 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_17 : i32
          %47 = arith.addi %c416_i32, %46 : i32
          %48 = arith.addi %47, %0 : i32
          %true_18 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%35#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%36: i32):  // no predecessors
        %c136_i32 = arith.constant 136 : i32
        %37 = arith.addi %c136_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %39 = simt_step.lane_id
        %40 = arith.index_cast %39 : index to i32
        %41 = "simt_step.switch"(%38, %40) ({
        ^bb0(%arg4: i32):
          %c0_i32_15 = arith.constant 0 : i32
          %44 = arith.addi %0, %c0_i32_15 : i32
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        ^bb1(%45: i32):  // no predecessors
          %c1_i32_16 = arith.constant 1 : i32
          %46 = arith.addi %0, %c1_i32_16 : i32
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        ^bb2(%47: i32):  // no predecessors
          %48 = simt_step.subgroup_id
          %49 = arith.index_cast %48 : index to i32
          %true_17 = arith.constant true
          %c432_i32 = arith.constant 432 : i32
          %50 = arith.addi %c432_i32, %0 : i32
          %true_18 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        %c448_i32 = arith.constant 448 : i32
        %42 = arith.addi %c448_i32, %0 : i32
        %true_14 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %26 = arith.muli %arg4, %c4_i32_8 : i32
        %27 = arith.addi %26, %0 : i32
        %c140_i32 = arith.constant 140 : i32
        %28 = arith.addi %c140_i32, %27 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_9 : i32
        "simt_step.condition"(%30, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c160_i32 = arith.constant 160 : i32
        %26 = arith.addi %c160_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_8 : i32
        %29 = "simt_step.if"(%28) ({
          %38 = simt_step.lane_id
          %39 = arith.index_cast %38 : index to i32
          "simt_step.yield"(%39) : (i32) -> ()
        }, {
          %c3_i32_14 = arith.constant 3 : i32
          %38 = arith.addi %0, %c3_i32_14 : i32
          "simt_step.yield"(%38) : (i32) -> ()
        }) : (i1) -> i32
        %c464_i32 = arith.constant 464 : i32
        %30 = arith.addi %c464_i32, %0 : i32
        %true_9 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %32 = arith.addi %arg3, %29 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %33 = arith.addi %arg4, %c1_i32_10 : i32
        %true_11 = arith.constant true
        %c480_i32 = arith.constant 480 : i32
        %c4_i32_12 = arith.constant 4 : i32
        %34 = arith.muli %arg4, %c4_i32_12 : i32
        %35 = arith.addi %c480_i32, %34 : i32
        %36 = arith.addi %35, %0 : i32
        %true_13 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%32, %33) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_6 = arith.constant true
      %c496_i32 = arith.constant 496 : i32
      %24 = arith.addi %c496_i32, %0 : i32
      %true_7 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

