module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %1 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.addi %1, %c1_i32 : i32
      %3 = arith.cmpi slt, %arg5, %2 : i32
      "simt_step.condition"(%3, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c3_i32 = arith.constant 3 : i32
      %1 = arith.remsi %arg3, %c3_i32 : i32
      %c3_i32_1 = arith.constant 3 : i32
      %2 = arith.addi %arg0, %c3_i32_1 : i32
      %3 = "simt_step.switch"(%1, %2) ({
      ^bb0(%arg6: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %5 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %6 = "simt_step.if"(%5) ({
          %true = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_4 = arith.constant 0 : i32
          %c4_i32_5 = arith.constant 4 : i32
          %21 = arith.muli %arg5, %c4_i32_5 : i32
          %22 = arith.addi %c0_i32_4, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) : (i32) -> ()
        }, {
          %true = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_4 = arith.constant 4 : i32
          %21 = arith.muli %arg5, %c4_i32_4 : i32
          %22 = arith.addi %c16_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
      ^bb1(%7: i32):  // no predecessors
        %c4_i32 = arith.constant 4 : i32
        %8 = arith.remsi %arg3, %c4_i32 : i32
        %9 = simt_step.subgroup_id
        %10 = arith.index_cast %9 : index to i32
        %11 = "simt_step.switch"(%8, %10) ({
        ^bb0(%arg7: i32):
          %true = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_4 = arith.constant 4 : i32
          %21 = arith.muli %arg5, %c4_i32_4 : i32
          %22 = arith.addi %c32_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          %true_5 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_6 = arith.constant 4 : i32
          %26 = arith.muli %arg5, %c4_i32_6 : i32
          %27 = arith.addi %c48_i32, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        ^bb2(%29: i32):  // no predecessors
          %true_7 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %31 = arith.muli %arg5, %c4_i32_8 : i32
          %32 = arith.addi %c64_i32, %31 : i32
          %33 = arith.addi %32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        ^bb3(%34: i32):  // no predecessors
          %true_9 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %36 = arith.muli %arg5, %c4_i32_10 : i32
          %37 = arith.addi %c80_i32, %36 : i32
          %38 = arith.addi %37, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %38, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
      ^bb2(%12: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %13 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %14 = "simt_step.if"(%13) ({
          %true = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_4 = arith.constant 4 : i32
          %21 = arith.muli %arg5, %c4_i32_4 : i32
          %22 = arith.addi %c96_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) : (i32) -> ()
        }, {
          %true = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_4 = arith.constant 4 : i32
          %21 = arith.muli %arg5, %c4_i32_4 : i32
          %22 = arith.addi %c112_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
      ^bb3(%15: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %16 = arith.remsi %arg3, %c2_i32 : i32
        %17 = simt_step.subgroup_id
        %18 = arith.index_cast %17 : index to i32
        %19 = "simt_step.switch"(%16, %18) ({
        ^bb0(%arg7: i32):
          %true = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_4 = arith.constant 4 : i32
          %21 = arith.muli %arg5, %c4_i32_4 : i32
          %22 = arith.addi %c128_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          %true_5 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_6 = arith.constant 4 : i32
          %26 = arith.muli %arg5, %c4_i32_6 : i32
          %27 = arith.addi %c144_i32, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %4 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.break"(%3, %4) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
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
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %19:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c2_i32 = arith.constant 2 : i32
        %20 = arith.cmpi slt, %arg3, %c2_i32 : i32
        "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c2_i32 = arith.constant 2 : i32
        %20 = arith.remsi %0, %c2_i32 : i32
        %c3_i32 = arith.constant 3 : i32
        %21 = "simt_step.switch"(%20, %c3_i32) ({
        ^bb0(%arg4: i32):
          %c2_i32_6 = arith.constant 2 : i32
          %23 = arith.addi %arg4, %c2_i32_6 : i32
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          %c0_i32_7 = arith.constant 0 : i32
          %25 = arith.addi %24, %c0_i32_7 : i32
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%arg2, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.lane_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %19 = arith.addi %c12_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_4 = arith.constant 4 : i32
      %21 = "simt_step.switch"(%20, %c4_i32_4) ({
      ^bb0(%arg3: i32):
        %true_12 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %34 = arith.addi %c160_i32, %0 : i32
        %true_13 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%36: i32):  // no predecessors
        %c16_i32 = arith.constant 16 : i32
        %37 = arith.addi %c16_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %39 = simt_step.subgroup_id
        %40 = arith.index_cast %39 : index to i32
        %41 = "simt_step.switch"(%38, %40) ({
        ^bb0(%arg4: i32):
          %46 = simt_step.lane_id
          %47 = arith.index_cast %46 : index to i32
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          %49 = simt_step.subgroup_id
          %50 = arith.index_cast %49 : index to i32
          %true_18 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %51 = arith.addi %c176_i32, %0 : i32
          %true_19 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %42 = arith.addi %c192_i32, %0 : i32
        %true_15 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) {fallthrough = true} : (i32) -> ()
      ^bb2(%44: i32):  // no predecessors
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %45:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_18 : i32
          %47 = arith.addi %46, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %48 = arith.addi %c20_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_19 : i32
          "simt_step.condition"(%50, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %46 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %arg5, %c1_i32 : i32
          %true_18 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %48 = arith.muli %arg5, %c4_i32_19 : i32
          %49 = arith.addi %c208_i32, %48 : i32
          %50 = arith.addi %49, %0 : i32
          %true_20 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%45#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      %c224_i32 = arith.constant 224 : i32
      %22 = arith.addi %c224_i32, %0 : i32
      %true_6 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb1(%24: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %25 = arith.addi %c40_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %27 = arith.cmpi ne, %26, %c0_i32_7 : i32
      %28 = "simt_step.if"(%27) ({
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_14 : i32
          %36 = arith.addi %35, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %37 = arith.addi %c44_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_15 : i32
          "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %35 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %arg4, %c1_i32 : i32
          %true_14 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %37 = arith.muli %arg4, %c4_i32_15 : i32
          %38 = arith.addi %c240_i32, %37 : i32
          %39 = arith.addi %38, %0 : i32
          %true_16 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%34#0) : (i32) -> ()
      }, {
        %c64_i32 = arith.constant 64 : i32
        %34 = arith.addi %c64_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %36 = simt_step.lane_id
        %37 = arith.index_cast %36 : index to i32
        %38 = "simt_step.switch"(%35, %37) ({
        ^bb0(%arg3: i32):
          %41 = simt_step.lane_id
          %42 = arith.index_cast %41 : index to i32
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          %c0_i32_14 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_14) {fallthrough = true} : (i32) -> ()
        ^bb2(%44: i32):  // no predecessors
          %true_15 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %45 = arith.addi %c256_i32, %0 : i32
          %true_16 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%47: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %48 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %39 = arith.addi %c272_i32, %0 : i32
        %true_13 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38) : (i32) -> ()
      }) : (i1) -> i32
      %c288_i32 = arith.constant 288 : i32
      %29 = arith.addi %c288_i32, %0 : i32
      %true_8 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_9 = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %31 = arith.addi %c304_i32, %0 : i32
      %true_10 = arith.constant true
      %32 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    ^bb2(%33: i32):  // no predecessors
      %c0_i32_11 = arith.constant 0 : i32
      "simt_step.yield"(%c0_i32_11) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c320_i32 = arith.constant 320 : i32
    %11 = arith.addi %c320_i32, %0 : i32
    %true_1 = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c68_i32 = arith.constant 68 : i32
    %13 = arith.addi %c68_i32, %0 : i32
    %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %15 = arith.cmpi ne, %14, %c0_i32_2 : i32
    %16 = "simt_step.if"(%15) ({
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %19:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %20 = arith.muli %arg3, %c4_i32_6 : i32
        %21 = arith.addi %20, %0 : i32
        %c72_i32 = arith.constant 72 : i32
        %22 = arith.addi %c72_i32, %21 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_7 : i32
        "simt_step.condition"(%24, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c92_i32 = arith.constant 92 : i32
        %20 = arith.addi %c92_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %22 = simt_step.subgroup_id
        %23 = arith.index_cast %22 : index to i32
        %24 = "simt_step.switch"(%21, %23) ({
        ^bb0(%arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %31 = arith.addi %0, %c4_i32_9 : i32
          %true_10 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %32 = arith.addi %c336_i32, %0 : i32
          %true_11 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %35 = simt_step.subgroup_id
          %36 = arith.index_cast %35 : index to i32
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb2(%37: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %true_12 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %38 = arith.addi %c352_i32, %0 : i32
          %true_13 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb3(%40: i32):  // no predecessors
          %41 = simt_step.lane_id
          %42 = arith.index_cast %41 : index to i32
          %true_14 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %43 = arith.addi %c368_i32, %0 : i32
          %true_15 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %25 = arith.addi %arg2, %24 : i32
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %arg3, %c1_i32 : i32
        %true_6 = arith.constant true
        %c384_i32 = arith.constant 384 : i32
        %c4_i32_7 = arith.constant 4 : i32
        %27 = arith.muli %arg3, %c4_i32_7 : i32
        %28 = arith.addi %c384_i32, %27 : i32
        %29 = arith.addi %28, %0 : i32
        %true_8 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%19#0) : (i32) -> ()
    }, {
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %19:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %20 = arith.muli %arg3, %c4_i32_6 : i32
        %21 = arith.addi %20, %0 : i32
        %c96_i32 = arith.constant 96 : i32
        %22 = arith.addi %c96_i32, %21 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_7 : i32
        "simt_step.condition"(%24, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %20 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %21 = arith.addi %arg3, %c1_i32 : i32
        %true_6 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %c4_i32_7 = arith.constant 4 : i32
        %22 = arith.muli %arg3, %c4_i32_7 : i32
        %23 = arith.addi %c400_i32, %22 : i32
        %24 = arith.addi %23, %0 : i32
        %true_8 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%20, %21) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%19#0) : (i32) -> ()
    }) : (i1) -> i32
    %c416_i32 = arith.constant 416 : i32
    %17 = arith.addi %c416_i32, %0 : i32
    %true_3 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

