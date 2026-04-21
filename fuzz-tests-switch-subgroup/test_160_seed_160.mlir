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
      "simt_step.continue"(%1#0, %2) : (i32, i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %17:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %18 = arith.muli %arg3, %c4_i32_5 : i32
        %19 = arith.addi %18, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %20 = arith.addi %c12_i32, %19 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %21, %c0_i32_6 : i32
        "simt_step.condition"(%22, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c32_i32 = arith.constant 32 : i32
        %18 = arith.addi %c32_i32, %0 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_5 : i32
        %21 = "simt_step.if"(%20) ({
          %30 = simt_step.lane_id
          %31 = arith.index_cast %30 : index to i32
          "simt_step.yield"(%31) : (i32) -> ()
        }, {
          %c1_i32_11 = arith.constant 1 : i32
          %30 = arith.addi %0, %c1_i32_11 : i32
          "simt_step.yield"(%30) : (i32) -> ()
        }) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %22 = arith.addi %c16_i32, %0 : i32
        %true_6 = arith.constant true
        %23 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %24 = arith.addi %arg2, %21 : i32
        %c1_i32 = arith.constant 1 : i32
        %25 = arith.addi %arg3, %c1_i32 : i32
        %true_7 = arith.constant true
        %c32_i32_8 = arith.constant 32 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %26 = arith.muli %arg3, %c4_i32_9 : i32
        %27 = arith.addi %c32_i32_8, %26 : i32
        %28 = arith.addi %27, %0 : i32
        %true_10 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24, %25) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%17#0) : (i32) -> ()
    }, {
      %c36_i32 = arith.constant 36 : i32
      %17 = arith.addi %c36_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %19 = arith.addi %0, %c3_i32 : i32
      %20 = "simt_step.switch"(%18, %19) ({
      ^bb0(%arg2: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %42 = arith.muli %arg4, %c4_i32_14 : i32
          %43 = arith.addi %42, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %44 = arith.addi %c40_i32, %43 : i32
          %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %46 = arith.cmpi ne, %45, %c0_i32_15 : i32
          "simt_step.condition"(%46, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %42 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %43 = arith.addi %arg4, %c1_i32 : i32
          %true_14 = arith.constant true
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %44 = arith.muli %arg4, %c4_i32_15 : i32
          %45 = arith.addi %c48_i32, %44 : i32
          %46 = arith.addi %45, %0 : i32
          %true_16 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42, %43) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_5 = arith.constant true
        %c64_i32 = arith.constant 64 : i32
        %22 = arith.addi %c64_i32, %0 : i32
        %true_6 = arith.constant true
        %23 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%24: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %25 = arith.addi %c60_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %27 = simt_step.subgroup_id
        %28 = arith.index_cast %27 : index to i32
        %29 = "simt_step.switch"(%26, %28) ({
        ^bb0(%arg3: i32):
          %c3_i32_14 = arith.constant 3 : i32
          %42 = arith.addi %0, %c3_i32_14 : i32
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          %44 = simt_step.subgroup_id
          %45 = arith.index_cast %44 : index to i32
          %true_15 = arith.constant true
          %c80_i32 = arith.constant 80 : i32
          %46 = arith.addi %c80_i32, %0 : i32
          %true_16 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        ^bb2(%48: i32):  // no predecessors
          %c3_i32_17 = arith.constant 3 : i32
          %49 = arith.addi %0, %c3_i32_17 : i32
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        ^bb3(%50: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        %c96_i32 = arith.constant 96 : i32
        %30 = arith.addi %c96_i32, %0 : i32
        %true_8 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
      ^bb2(%32: i32):  // no predecessors
        %c64_i32_9 = arith.constant 64 : i32
        %33 = arith.addi %c64_i32_9, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_10 : i32
        %36 = "simt_step.if"(%35) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c3_i32_14 = arith.constant 3 : i32
          %42 = arith.addi %0, %c3_i32_14 : i32
          "simt_step.yield"(%42) : (i32) -> ()
        }) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %37 = arith.addi %c112_i32, %0 : i32
        %true_11 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) {fallthrough = true} : (i32) -> ()
      ^bb3(%39: i32):  // no predecessors
        %true_12 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %40 = arith.addi %c128_i32, %0 : i32
        %true_13 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%20) : (i32) -> ()
    }) : (i1) -> i32
    %c144_i32 = arith.constant 144 : i32
    %9 = arith.addi %c144_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c68_i32 = arith.constant 68 : i32
    %11 = arith.addi %c68_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %13 = arith.cmpi ne, %12, %c0_i32_1 : i32
    %14 = "simt_step.if"(%13) ({
      %c72_i32 = arith.constant 72 : i32
      %17 = arith.addi %c72_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %19 = simt_step.subgroup_id
      %20 = arith.index_cast %19 : index to i32
      %21 = "simt_step.switch"(%18, %20) ({
      ^bb0(%arg2: i32):
        %c76_i32 = arith.constant 76 : i32
        %22 = arith.addi %c76_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %24 = arith.addi %0, %c2_i32 : i32
        %25 = "simt_step.switch"(%23, %24) ({
        ^bb0(%arg3: i32):
          %c0_i32_15 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_15) {fallthrough = false} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          %c0_i32_16 = arith.constant 0 : i32
          %true_17 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %49 = arith.addi %c160_i32, %0 : i32
          %true_18 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_16) {fallthrough = false} : (i32) -> ()
        ^bb2(%51: i32):  // no predecessors
          %52 = simt_step.lane_id
          %53 = arith.index_cast %52 : index to i32
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_3 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %26 = arith.addi %c176_i32, %0 : i32
        %true_4 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb1(%28: i32):  // no predecessors
        %c80_i32 = arith.constant 80 : i32
        %29 = arith.addi %c80_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_5 : i32
        %32 = "simt_step.if"(%31) ({
          %48 = simt_step.subgroup_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) : (i32) -> ()
        }, {
          %c0_i32_15 = arith.constant 0 : i32
          %48 = arith.addi %0, %c0_i32_15 : i32
          "simt_step.yield"(%48) : (i32) -> ()
        }) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %33 = arith.addi %c192_i32, %0 : i32
        %true_6 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_7 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %35 = arith.addi %c208_i32, %0 : i32
        %true_8 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      ^bb2(%37: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %38:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %48 = arith.muli %arg4, %c4_i32_15 : i32
          %49 = arith.addi %48, %0 : i32
          %c84_i32 = arith.constant 84 : i32
          %50 = arith.addi %c84_i32, %49 : i32
          %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %52 = arith.cmpi ne, %51, %c0_i32_16 : i32
          "simt_step.condition"(%52, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %48 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %49 = arith.addi %arg4, %c1_i32 : i32
          %true_15 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %50 = arith.muli %arg4, %c4_i32_16 : i32
          %51 = arith.addi %c224_i32, %50 : i32
          %52 = arith.addi %51, %0 : i32
          %true_17 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%48, %49) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %39 = arith.addi %c240_i32, %0 : i32
        %true_12 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38#0) {fallthrough = true} : (i32) -> ()
      ^bb3(%41: i32):  // no predecessors
        %c104_i32 = arith.constant 104 : i32
        %42 = arith.addi %c104_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %44 = arith.cmpi ne, %43, %c0_i32_13 : i32
        %45 = "simt_step.if"(%44) ({
          %c2_i32_15 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_15) : (i32) -> ()
        }, {
          %48 = simt_step.subgroup_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32 = arith.constant 256 : i32
        %46 = arith.addi %c256_i32, %0 : i32
        %true_14 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%21) : (i32) -> ()
    }, {
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %17:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %18 = arith.muli %arg3, %c4_i32_5 : i32
        %19 = arith.addi %18, %0 : i32
        %c108_i32 = arith.constant 108 : i32
        %20 = arith.addi %c108_i32, %19 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %21, %c0_i32_6 : i32
        "simt_step.condition"(%22, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %18 = simt_step.lane_id
        %19 = arith.index_cast %18 : index to i32
        %20 = arith.addi %arg2, %19 : i32
        %c1_i32 = arith.constant 1 : i32
        %21 = arith.addi %arg3, %c1_i32 : i32
        %true_5 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %c4_i32_6 = arith.constant 4 : i32
        %22 = arith.muli %arg3, %c4_i32_6 : i32
        %23 = arith.addi %c272_i32, %22 : i32
        %24 = arith.addi %23, %0 : i32
        %true_7 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20, %21) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%17#0) : (i32) -> ()
    }) : (i1) -> i32
    %c288_i32 = arith.constant 288 : i32
    %15 = arith.addi %c288_i32, %0 : i32
    %true_2 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

