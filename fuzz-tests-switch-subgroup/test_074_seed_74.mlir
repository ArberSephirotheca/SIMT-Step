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
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %1:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %3 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_3 = arith.constant 1 : i32
        %4 = arith.addi %3, %c1_i32_3 : i32
        %5 = arith.cmpi slt, %arg7, %4 : i32
        "simt_step.condition"(%5, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %3:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg8: i32, %arg9: i32):
          %c4_i32 = arith.constant 4 : i32
          %5 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %6 = arith.addi %5, %c1_i32_6 : i32
          %7 = arith.cmpi slt, %arg9, %6 : i32
          "simt_step.condition"(%7, %arg8, %arg9) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg8: i32, %arg9: i32):
          %true = arith.constant true
          %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_6 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.muli %arg9, %c4_i32 : i32
          %7 = arith.addi %c0_i32_6, %6 : i32
          %8 = arith.addi %7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_7 = arith.constant 1 : i32
          %9 = arith.addi %arg9, %c1_i32_7 : i32
          "simt_step.yield"(%5, %9) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_5 = arith.constant 1 : i32
        %4 = arith.addi %arg7, %c1_i32_5 : i32
        "simt_step.yield"(%3#0, %4) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%1#0, %2) : (i32, i32) -> ()
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
    call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %7 = simt_step.lane_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %31 = arith.muli %arg4, %c4_i32_8 : i32
        %32 = arith.addi %31, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %33 = arith.addi %c12_i32, %32 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_9 : i32
        "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %31 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %32 = arith.addi %arg4, %c1_i32 : i32
        %true_8 = arith.constant true
        %c16_i32 = arith.constant 16 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %33 = arith.muli %arg4, %c4_i32_9 : i32
        %34 = arith.addi %c16_i32, %33 : i32
        %35 = arith.addi %34, %0 : i32
        %true_10 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31, %32) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %c32_i32 = arith.constant 32 : i32
      %16 = arith.addi %c32_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %18 = "simt_step.switch"(%17, %0) ({
      ^bb0(%arg3: i32):
        %c36_i32 = arith.constant 36 : i32
        %31 = arith.addi %c36_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_8 : i32
        %34 = "simt_step.if"(%33) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c0_i32_15 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_15) : (i32) -> ()
        }) : (i1) -> i32
        %c32_i32_9 = arith.constant 32 : i32
        %35 = arith.addi %c32_i32_9, %0 : i32
        %true_10 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_11 = arith.constant true
        %c48_i32 = arith.constant 48 : i32
        %37 = arith.addi %c48_i32, %0 : i32
        %true_12 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      ^bb1(%39: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %40 = arith.addi %c40_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_13 : i32
        %43 = "simt_step.if"(%42) ({
          %c4_i32_15 = arith.constant 4 : i32
          %46 = arith.addi %0, %c4_i32_15 : i32
          "simt_step.yield"(%46) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %44 = arith.addi %c64_i32, %0 : i32
        %true_14 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c80_i32 = arith.constant 80 : i32
      %19 = arith.addi %c80_i32, %0 : i32
      %true_4 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb2(%21: i32):  // no predecessors
      %c44_i32 = arith.constant 44 : i32
      %22 = arith.addi %c44_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %24 = simt_step.subgroup_id
      %25 = arith.index_cast %24 : index to i32
      %26 = "simt_step.switch"(%23, %25) ({
      ^bb0(%arg3: i32):
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %43 = arith.muli %arg5, %c4_i32_14 : i32
          %44 = arith.addi %43, %0 : i32
          %c48_i32 = arith.constant 48 : i32
          %45 = arith.addi %c48_i32, %44 : i32
          %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %47 = arith.cmpi ne, %46, %c0_i32_15 : i32
          "simt_step.condition"(%47, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %43 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %44 = arith.addi %arg5, %c1_i32 : i32
          %true_14 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %45 = arith.muli %arg5, %c4_i32_15 : i32
          %46 = arith.addi %c96_i32, %45 : i32
          %47 = arith.addi %46, %0 : i32
          %true_16 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43, %44) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_10 = arith.constant true
        %c112_i32 = arith.constant 112 : i32
        %33 = arith.addi %c112_i32, %0 : i32
        %true_11 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%35: i32):  // no predecessors
        %c68_i32 = arith.constant 68 : i32
        %36 = arith.addi %c68_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %38 = simt_step.subgroup_id
        %39 = arith.index_cast %38 : index to i32
        %40 = "simt_step.switch"(%37, %39) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %44 = arith.addi %0, %c1_i32 : i32
          %true_14 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %45 = arith.addi %c128_i32, %0 : i32
          %true_15 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %41 = arith.addi %c144_i32, %0 : i32
        %true_13 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    ^bb3(%27: i32):  // no predecessors
      %c2_i32_5 = arith.constant 2 : i32
      %28 = arith.addi %0, %c2_i32_5 : i32
      %true_6 = arith.constant true
      %c160_i32 = arith.constant 160 : i32
      %29 = arith.addi %c160_i32, %0 : i32
      %true_7 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %10:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_2 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_2 : i32
      %15 = arith.addi %14, %0 : i32
      %c72_i32 = arith.constant 72 : i32
      %16 = arith.addi %c72_i32, %15 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_3 : i32
      "simt_step.condition"(%18, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %14 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c176_i32 = arith.constant 176 : i32
      %c4_i32_2 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_2 : i32
      %17 = arith.addi %c176_i32, %16 : i32
      %18 = arith.addi %17, %0 : i32
      %true_3 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.continue"(%14, %15) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c92_i32 = arith.constant 92 : i32
    %11 = arith.addi %c92_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c2_i32 = arith.constant 2 : i32
    %13 = "simt_step.switch"(%12, %c2_i32) ({
    ^bb0(%arg2: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %19 = arith.muli %arg4, %c4_i32_7 : i32
        %20 = arith.addi %19, %0 : i32
        %c96_i32 = arith.constant 96 : i32
        %21 = arith.addi %c96_i32, %20 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_8 : i32
        "simt_step.condition"(%23, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c116_i32 = arith.constant 116 : i32
        %19 = arith.addi %c116_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %21 = "simt_step.switch"(%20, %c3_i32) ({
        ^bb0(%arg5: i32):
          %30 = simt_step.subgroup_id
          %31 = arith.index_cast %30 : index to i32
          "simt_step.yield"(%31) {fallthrough = true} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %c2_i32_12 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_12) {fallthrough = true} : (i32) -> ()
        ^bb2(%33: i32):  // no predecessors
          %true_13 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %34 = arith.addi %c192_i32, %0 : i32
          %true_14 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb3(%36: i32):  // no predecessors
          %true_15 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %37 = arith.addi %c208_i32, %0 : i32
          %true_16 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %22 = arith.addi %c224_i32, %0 : i32
        %true_8 = arith.constant true
        %23 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %24 = arith.addi %arg3, %21 : i32
        %c1_i32 = arith.constant 1 : i32
        %25 = arith.addi %arg4, %c1_i32 : i32
        %true_9 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %c4_i32_10 = arith.constant 4 : i32
        %26 = arith.muli %arg4, %c4_i32_10 : i32
        %27 = arith.addi %c240_i32, %26 : i32
        %28 = arith.addi %27, %0 : i32
        %true_11 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24, %25) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %19 = arith.muli %arg4, %c4_i32_7 : i32
        %20 = arith.addi %19, %0 : i32
        %c120_i32 = arith.constant 120 : i32
        %21 = arith.addi %c120_i32, %20 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_8 : i32
        "simt_step.condition"(%23, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %19 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %20 = arith.addi %arg4, %c1_i32 : i32
        %true_7 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %21 = arith.muli %arg4, %c4_i32_8 : i32
        %22 = arith.addi %c256_i32, %21 : i32
        %23 = arith.addi %22, %0 : i32
        %true_9 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%19, %20) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true = arith.constant true
      %c272_i32 = arith.constant 272 : i32
      %17 = arith.addi %c272_i32, %0 : i32
      %true_6 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

