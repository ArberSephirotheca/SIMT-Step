module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %1 = simt_step.lane_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c0_i32 = arith.constant 0 : i32
      %c0_i32_0 = arith.constant 0 : i32
      %4:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %10 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %11 = arith.addi %10, %c1_i32 : i32
        %12 = arith.cmpi slt, %arg6, %11 : i32
        "simt_step.condition"(%12, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %10 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %11 = "simt_step.if"(%10) ({
          %true_4 = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c0_i32_5 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %14 = arith.muli %arg6, %c4_i32 : i32
          %15 = arith.addi %c0_i32_5, %14 : i32
          %16 = arith.addi %15, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%13) : (i32) -> ()
        }, {
          %true_4 = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %14 = arith.muli %arg6, %c4_i32 : i32
          %15 = arith.addi %c16_i32, %14 : i32
          %16 = arith.addi %15, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%13) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32 = arith.constant 1 : i32
        %12 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.continue"(%11, %12) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%4#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%5: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %6:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %10 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %11 = arith.addi %10, %c1_i32 : i32
        %12 = arith.cmpi slt, %arg6, %11 : i32
        "simt_step.condition"(%12, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %10 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %11 = "simt_step.if"(%10) ({
          %true_4 = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %14 = arith.muli %arg6, %c4_i32 : i32
          %15 = arith.addi %c32_i32, %14 : i32
          %16 = arith.addi %15, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%13) : (i32) -> ()
        }, {
          %true_4 = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32 = arith.constant 4 : i32
          %14 = arith.muli %arg6, %c4_i32 : i32
          %15 = arith.addi %c48_i32, %14 : i32
          %16 = arith.addi %15, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%13) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32 = arith.constant 1 : i32
        %12 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.continue"(%11, %12) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%6#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%7: i32):  // no predecessors
      %true = arith.constant true
      %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c64_i32 = arith.constant 64 : i32
      %9 = arith.addi %c64_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
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
      %21 = arith.addi %c8_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_4 : i32
      "simt_step.if"(%23) ({
        %c4_i32_5 = arith.constant 4 : i32
        %24 = arith.remsi %0, %c4_i32_5 : i32
        %25 = simt_step.subgroup_id
        %26 = arith.index_cast %25 : index to i32
        %27 = "simt_step.switch"(%24, %26) ({
        ^bb0(%arg2: i32):
          %c4_i32_6 = arith.constant 4 : i32
          %28 = arith.addi %arg2, %c4_i32_6 : i32
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %c0_i32_7 = arith.constant 0 : i32
          %30 = arith.addi %29, %c0_i32_7 : i32
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %32 = arith.addi %31, %c2_i32 : i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb3(%33: i32):  // no predecessors
          %c0_i32_8 = arith.constant 0 : i32
          %34 = arith.addi %33, %c0_i32_8 : i32
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
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
    %8 = simt_step.subgroup_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %21:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %33 = arith.muli %arg4, %c4_i32_8 : i32
        %34 = arith.addi %33, %0 : i32
        %c16_i32 = arith.constant 16 : i32
        %35 = arith.addi %c16_i32, %34 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_9 : i32
        "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %33 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %34 = arith.addi %arg4, %c1_i32 : i32
        %true_8 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %35 = arith.muli %arg4, %c4_i32_9 : i32
        %36 = arith.addi %c80_i32, %35 : i32
        %37 = arith.addi %36, %0 : i32
        %true_10 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%33, %34) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_6 = arith.constant true
      %c96_i32 = arith.constant 96 : i32
      %22 = arith.addi %c96_i32, %0 : i32
      %true_7 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%24: i32):  // no predecessors
      %25 = simt_step.lane_id
      %26 = arith.index_cast %25 : index to i32
      "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
    ^bb2(%27: i32):  // no predecessors
      %c36_i32 = arith.constant 36 : i32
      %28 = arith.addi %c36_i32, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %30 = simt_step.lane_id
      %31 = arith.index_cast %30 : index to i32
      %32 = "simt_step.switch"(%29, %31) ({
      ^bb0(%arg3: i32):
        %c40_i32 = arith.constant 40 : i32
        %33 = arith.addi %c40_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %35 = "simt_step.switch"(%34, %0) ({
        ^bb0(%arg4: i32):
          %45 = simt_step.lane_id
          %46 = arith.index_cast %45 : index to i32
          %true_12 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %47 = arith.addi %c112_i32, %0 : i32
          %true_13 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        ^bb1(%49: i32):  // no predecessors
          %50 = simt_step.subgroup_id
          %51 = arith.index_cast %50 : index to i32
          %true_14 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %52 = arith.addi %c128_i32, %0 : i32
          %true_15 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        ^bb2(%54: i32):  // no predecessors
          %55 = simt_step.subgroup_id
          %56 = arith.index_cast %55 : index to i32
          %true_16 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %57 = arith.addi %c144_i32, %0 : i32
          %true_17 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
        ^bb3(%59: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      ^bb1(%36: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %37 = arith.addi %c44_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_8 : i32
        %40 = "simt_step.if"(%39) ({
          %c2_i32 = arith.constant 2 : i32
          %45 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%45) : (i32) -> ()
        }, {
          %c0_i32_12 = arith.constant 0 : i32
          %45 = arith.addi %0, %c0_i32_12 : i32
          "simt_step.yield"(%45) : (i32) -> ()
        }) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %41 = arith.addi %c160_i32, %0 : i32
        %true_9 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_10 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %43 = arith.addi %c176_i32, %0 : i32
        %true_11 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c192_i32 = arith.constant 192 : i32
    %11 = arith.addi %c192_i32, %0 : i32
    %true_1 = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c48_i32 = arith.constant 48 : i32
    %13 = arith.addi %c48_i32, %0 : i32
    %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %15 = arith.cmpi ne, %14, %c0_i32_2 : i32
    %16 = "simt_step.if"(%15) ({
      "simt_step.yield"(%0) : (i32) -> ()
    }, {
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %21:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %22 = arith.muli %arg3, %c4_i32_6 : i32
        %23 = arith.addi %22, %0 : i32
        %c52_i32 = arith.constant 52 : i32
        %24 = arith.addi %c52_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_7 : i32
        "simt_step.condition"(%26, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %22 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %23 = arith.addi %arg3, %c1_i32 : i32
        %true_6 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %c4_i32_7 = arith.constant 4 : i32
        %24 = arith.muli %arg3, %c4_i32_7 : i32
        %25 = arith.addi %c208_i32, %24 : i32
        %26 = arith.addi %25, %0 : i32
        %true_8 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%21#0) : (i32) -> ()
    }) : (i1) -> i32
    %c224_i32 = arith.constant 224 : i32
    %17 = arith.addi %c224_i32, %0 : i32
    %true_3 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %19 = simt_step.subgroup_id
    %20 = arith.index_cast %19 : index to i32
    return
  }
}

