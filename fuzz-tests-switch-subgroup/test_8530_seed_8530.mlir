module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c3_i32 = arith.constant 3 : i32
    %2 = arith.remsi %arg3, %c3_i32 : i32
    %c2_i32 = arith.constant 2 : i32
    %3 = arith.addi %arg0, %c2_i32 : i32
    %4 = "simt_step.switch"(%2, %3) ({
    ^bb0(%arg4: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %9:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %21 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %21, %c1_i32 : i32
        %23 = arith.cmpi slt, %arg6, %22 : i32
        "simt_step.condition"(%23, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %23 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %24 = arith.addi %23, %c1_i32_12 : i32
          %25 = arith.cmpi slt, %arg8, %24 : i32
          "simt_step.condition"(%25, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_12 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %24 = arith.muli %arg8, %c4_i32 : i32
          %25 = arith.addi %c16_i32, %24 : i32
          %26 = arith.addi %25, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_13 = arith.constant 1 : i32
          %27 = arith.addi %arg8, %c1_i32_13 : i32
          "simt_step.yield"(%23, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%21#0, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%9#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%10: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %21 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %21, %c1_i32 : i32
        %23 = arith.cmpi slt, %arg6, %22 : i32
        "simt_step.condition"(%23, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %true_10 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %c4_i32 = arith.constant 4 : i32
        %22 = arith.muli %arg6, %c4_i32 : i32
        %23 = arith.addi %c32_i32, %22 : i32
        %24 = arith.addi %23, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %24, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %25 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.continue"(%21, %25) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%11#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%12: i32):  // no predecessors
      %c3_i32_6 = arith.constant 3 : i32
      %13 = arith.remsi %arg3, %c3_i32_6 : i32
      %14 = simt_step.subgroup_id
      %15 = arith.index_cast %14 : index to i32
      %16 = "simt_step.switch"(%13, %15) ({
      ^bb0(%arg5: i32):
        %true_10 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %22 = arith.addi %c48_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c3_i32_11 = arith.constant 3 : i32
        %24 = arith.remsi %arg3, %c3_i32_11 : i32
        %25 = "simt_step.switch"(%24, %arg0) ({
        ^bb0(%arg6: i32):
          %true_15 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %32 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) {fallthrough = true} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          %true_16 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %35 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %35, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        ^bb2(%36: i32):  // no predecessors
          %true_17 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %38 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %38, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
      ^bb2(%26: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %31 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %31, %c1_i32 : i32
          %33 = arith.cmpi slt, %arg7, %32 : i32
          "simt_step.condition"(%33, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_15 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32 = arith.constant 4 : i32
          %32 = arith.muli %arg7, %c4_i32 : i32
          %33 = arith.addi %c112_i32, %32 : i32
          %34 = arith.addi %33, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %35 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%31, %35) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%27#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%28: i32):  // no predecessors
        %c0_i32_14 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %arg2, %c0_i32_14 : i32
        %30 = "simt_step.if"(%29) ({
          %true_15 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %32 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) : (i32) -> ()
        }, {
          %true_15 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %32 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      %c160_i32 = arith.constant 160 : i32
      %18 = arith.addi %c160_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb3(%19: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %21 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %21, %c1_i32 : i32
        %23 = arith.cmpi slt, %arg6, %22 : i32
        "simt_step.condition"(%23, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c2_i32_10 = arith.constant 2 : i32
        %21 = arith.remsi %arg3, %c2_i32_10 : i32
        %c4_i32 = arith.constant 4 : i32
        %22 = arith.addi %arg0, %c4_i32 : i32
        %23 = "simt_step.switch"(%21, %22) ({
        ^bb0(%arg7: i32):
          %true_11 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %26 = arith.muli %arg6, %c4_i32_12 : i32
          %27 = arith.addi %c176_i32, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %true_13 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %31 = arith.muli %arg6, %c4_i32_14 : i32
          %32 = arith.addi %c192_i32, %31 : i32
          %33 = arith.addi %32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %24 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.break"(%23, %24) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%20#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_0 = arith.constant true
    %5 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    %c208_i32 = arith.constant 208 : i32
    %6 = arith.addi %c208_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %6, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %8 = arith.select %7, %0, %4 : i32
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
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %34 = arith.muli %arg4, %c4_i32_11 : i32
        %35 = arith.addi %34, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %36 = arith.addi %c12_i32, %35 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_12 : i32
        "simt_step.condition"(%38, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %34 = simt_step.lane_id
        %35 = arith.index_cast %34 : index to i32
        %36 = arith.addi %arg3, %35 : i32
        %c1_i32 = arith.constant 1 : i32
        %37 = arith.addi %arg4, %c1_i32 : i32
        %true_11 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %c4_i32_12 = arith.constant 4 : i32
        %38 = arith.muli %arg4, %c4_i32_12 : i32
        %39 = arith.addi %c224_i32, %38 : i32
        %40 = arith.addi %39, %0 : i32
        %true_13 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%36, %37) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %c32_i32 = arith.constant 32 : i32
      %16 = arith.addi %c32_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %18 = simt_step.lane_id
      %19 = arith.index_cast %18 : index to i32
      %20 = "simt_step.switch"(%17, %19) ({
      ^bb0(%arg3: i32):
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %57 = arith.muli %arg5, %c4_i32_19 : i32
          %58 = arith.addi %57, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %59 = arith.addi %c36_i32, %58 : i32
          %60 = "simt_step.buffer.load"(%arg1, %59) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %61 = arith.cmpi ne, %60, %c0_i32_20 : i32
          "simt_step.condition"(%61, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %57 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %58 = arith.addi %arg5, %c1_i32 : i32
          %true_19 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_20 = arith.constant 4 : i32
          %59 = arith.muli %arg5, %c4_i32_20 : i32
          %60 = arith.addi %c240_i32, %59 : i32
          %61 = arith.addi %60, %0 : i32
          %true_21 = arith.constant true
          %62 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%57, %58) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%34#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%35: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %36 = arith.addi %c56_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_13 : i32
        %39 = "simt_step.if"(%38) ({
          %57 = simt_step.subgroup_id
          %58 = arith.index_cast %57 : index to i32
          "simt_step.yield"(%58) : (i32) -> ()
        }, {
          %57 = simt_step.lane_id
          %58 = arith.index_cast %57 : index to i32
          "simt_step.yield"(%58) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32 = arith.constant 256 : i32
        %40 = arith.addi %c256_i32, %0 : i32
        %true_14 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_15 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %42 = arith.addi %c272_i32, %0 : i32
        %true_16 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      ^bb2(%44: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %45 = arith.addi %c60_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %47 = arith.cmpi ne, %46, %c0_i32_17 : i32
        %48 = "simt_step.if"(%47) ({
          %c0_i32_19 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_19) : (i32) -> ()
        }, {
          %c4_i32_19 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_19) : (i32) -> ()
        }) : (i1) -> i32
        %c288_i32 = arith.constant 288 : i32
        %49 = arith.addi %c288_i32, %0 : i32
        %true_18 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
      ^bb3(%51: i32):  // no predecessors
        %c64_i32 = arith.constant 64 : i32
        %52 = arith.addi %c64_i32, %0 : i32
        %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
        %54 = simt_step.lane_id
        %55 = arith.index_cast %54 : index to i32
        %56 = "simt_step.switch"(%53, %55) ({
        ^bb0(%arg4: i32):
          %true_19 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %57 = arith.addi %c304_i32, %0 : i32
          %true_20 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%59: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %60 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%60) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %c320_i32 = arith.constant 320 : i32
      %21 = arith.addi %c320_i32, %0 : i32
      %true_4 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_5 = arith.constant true
      %c336_i32 = arith.constant 336 : i32
      %23 = arith.addi %c336_i32, %0 : i32
      %true_6 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %26 = arith.addi %c68_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %28 = arith.cmpi ne, %27, %c0_i32_7 : i32
      %29 = "simt_step.if"(%28) ({
        %c72_i32 = arith.constant 72 : i32
        %34 = arith.addi %c72_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %36 = simt_step.subgroup_id
        %37 = arith.index_cast %36 : index to i32
        %38 = "simt_step.switch"(%35, %37) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          %42 = simt_step.subgroup_id
          %43 = arith.index_cast %42 : index to i32
          %true_13 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %44 = arith.addi %c352_i32, %0 : i32
          %true_14 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        %c368_i32 = arith.constant 368 : i32
        %39 = arith.addi %c368_i32, %0 : i32
        %true_12 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38) : (i32) -> ()
      }, {
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_13 : i32
          %36 = arith.addi %35, %0 : i32
          %c76_i32 = arith.constant 76 : i32
          %37 = arith.addi %c76_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_14 : i32
          "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %35 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %arg4, %c1_i32 : i32
          %true_13 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %37 = arith.muli %arg4, %c4_i32_14 : i32
          %38 = arith.addi %c384_i32, %37 : i32
          %39 = arith.addi %38, %0 : i32
          %true_15 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%34#0) : (i32) -> ()
      }) : (i1) -> i32
      %c400_i32 = arith.constant 400 : i32
      %30 = arith.addi %c400_i32, %0 : i32
      %true_8 = arith.constant true
      %31 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_9 = arith.constant true
      %c416_i32 = arith.constant 416 : i32
      %32 = arith.addi %c416_i32, %0 : i32
      %true_10 = arith.constant true
      %33 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %c96_i32 = arith.constant 96 : i32
    %8 = arith.addi %c96_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %10 = arith.cmpi ne, %9, %c0_i32_0 : i32
    %11 = "simt_step.if"(%10) ({
      %c100_i32 = arith.constant 100 : i32
      %14 = arith.addi %c100_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_1 : i32
      %17 = "simt_step.if"(%16) ({
        %c104_i32 = arith.constant 104 : i32
        %20 = arith.addi %c104_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %21, %c0_i32_3 : i32
        %23 = "simt_step.if"(%22) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %26 = simt_step.lane_id
          %27 = arith.index_cast %26 : index to i32
          "simt_step.yield"(%27) : (i32) -> ()
        }) : (i1) -> i32
        %c432_i32 = arith.constant 432 : i32
        %24 = arith.addi %c432_i32, %0 : i32
        %true_4 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%23) : (i32) -> ()
      }, {
        %20 = simt_step.lane_id
        %21 = arith.index_cast %20 : index to i32
        "simt_step.yield"(%21) : (i32) -> ()
      }) : (i1) -> i32
      %c448_i32 = arith.constant 448 : i32
      %18 = arith.addi %c448_i32, %0 : i32
      %true_2 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17) : (i32) -> ()
    }, {
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %15 = arith.muli %arg3, %c4_i32_3 : i32
        %16 = arith.addi %15, %0 : i32
        %c108_i32 = arith.constant 108 : i32
        %17 = arith.addi %c108_i32, %16 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %18, %c0_i32_4 : i32
        "simt_step.condition"(%19, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c128_i32 = arith.constant 128 : i32
        %15 = arith.addi %c128_i32, %0 : i32
        %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
        %17 = simt_step.subgroup_id
        %18 = arith.index_cast %17 : index to i32
        %19 = "simt_step.switch"(%16, %18) ({
        ^bb0(%arg4: i32):
          %c0_i32_8 = arith.constant 0 : i32
          %28 = arith.addi %0, %c0_i32_8 : i32
          %true_9 = arith.constant true
          %c464_i32 = arith.constant 464 : i32
          %29 = arith.addi %c464_i32, %0 : i32
          %true_10 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = true} : (i32) -> ()
        ^bb1(%31: i32):  // no predecessors
          %c4_i32_11 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_11) {fallthrough = true} : (i32) -> ()
        ^bb2(%32: i32):  // no predecessors
          %33 = simt_step.subgroup_id
          %34 = arith.index_cast %33 : index to i32
          "simt_step.yield"(%34) {fallthrough = true} : (i32) -> ()
        ^bb3(%35: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_3 = arith.constant true
        %c480_i32 = arith.constant 480 : i32
        %20 = arith.addi %c480_i32, %0 : i32
        %true_4 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %22 = arith.addi %arg2, %19 : i32
        %c1_i32 = arith.constant 1 : i32
        %23 = arith.addi %arg3, %c1_i32 : i32
        %true_5 = arith.constant true
        %c496_i32 = arith.constant 496 : i32
        %c4_i32_6 = arith.constant 4 : i32
        %24 = arith.muli %arg3, %c4_i32_6 : i32
        %25 = arith.addi %c496_i32, %24 : i32
        %26 = arith.addi %25, %0 : i32
        %true_7 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%14#0) : (i32) -> ()
    }) : (i1) -> i32
    %c512_i32 = arith.constant 512 : i32
    %12 = arith.addi %c512_i32, %0 : i32
    %true = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

