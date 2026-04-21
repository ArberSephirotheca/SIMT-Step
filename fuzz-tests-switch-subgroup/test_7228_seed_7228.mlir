module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %c0_i32 = arith.constant 0 : i32
    %1 = "simt_step.switch"(%0, %c0_i32) ({
    ^bb0(%arg4: i32):
      %c3_i32 = arith.constant 3 : i32
      %4 = arith.remsi %arg3, %c3_i32 : i32
      %5 = simt_step.subgroup_id
      %6 = arith.index_cast %5 : index to i32
      %7 = "simt_step.switch"(%4, %6) ({
      ^bb0(%arg5: i32):
        %c0_i32_1 = arith.constant 0 : i32
        %11 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %12 = "simt_step.if"(%11) ({
          %true_5 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c0_i32_6 = arith.constant 0 : i32
          %19 = arith.addi %c0_i32_6, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) : (i32) -> ()
        }, {
          %true_5 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %19 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      ^bb1(%13: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %18 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %19 = arith.addi %18, %c1_i32 : i32
          %20 = arith.cmpi slt, %arg7, %19 : i32
          "simt_step.condition"(%20, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_5 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %19 = arith.muli %arg7, %c4_i32 : i32
          %20 = arith.addi %c32_i32, %19 : i32
          %21 = arith.addi %20, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %22 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%18, %22) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%15: i32):  // no predecessors
        %true_4 = arith.constant true
        %16 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %17 = arith.addi %c48_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%7) {fallthrough = true} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      %c0_i32_0 = arith.constant 0 : i32
      %9 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %10 = "simt_step.if"(%9) ({
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %11:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %12 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %13 = arith.addi %12, %c1_i32 : i32
          %14 = arith.cmpi slt, %arg6, %13 : i32
          "simt_step.condition"(%14, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_3 = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.muli %arg6, %c4_i32 : i32
          %14 = arith.addi %c64_i32, %13 : i32
          %15 = arith.addi %14, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %16 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%12, %16) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%11#0) : (i32) -> ()
      }, {
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %11:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %12 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %13 = arith.addi %12, %c1_i32 : i32
          %14 = arith.cmpi slt, %arg6, %13 : i32
          "simt_step.condition"(%14, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_3 = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.muli %arg6, %c4_i32 : i32
          %14 = arith.addi %c80_i32, %13 : i32
          %15 = arith.addi %14, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %16 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%12, %16) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%11#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c96_i32 = arith.constant 96 : i32
    %3 = arith.addi %c96_i32, %arg0 : i32
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
    call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %7 = simt_step.lane_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %24 = arith.addi %c12_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %26 = arith.addi %0, %c0_i32_5 : i32
      %27 = "simt_step.switch"(%25, %26) ({
      ^bb0(%arg3: i32):
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %36:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_24 = arith.constant 4 : i32
          %50 = arith.muli %arg5, %c4_i32_24 : i32
          %51 = arith.addi %50, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %52 = arith.addi %c16_i32, %51 : i32
          %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_25 = arith.constant 0 : i32
          %54 = arith.cmpi ne, %53, %c0_i32_25 : i32
          "simt_step.condition"(%54, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %50 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %51 = arith.addi %arg5, %c1_i32 : i32
          %true_24 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_25 = arith.constant 4 : i32
          %52 = arith.muli %arg5, %c4_i32_25 : i32
          %53 = arith.addi %c112_i32, %52 : i32
          %54 = arith.addi %53, %0 : i32
          %true_26 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_26) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%50, %51) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_16 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %37 = arith.addi %c128_i32, %0 : i32
        %true_17 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%39: i32):  // no predecessors
        %40 = simt_step.lane_id
        %41 = arith.index_cast %40 : index to i32
        %true_18 = arith.constant true
        %c144_i32_19 = arith.constant 144 : i32
        %42 = arith.addi %c144_i32_19, %0 : i32
        %true_20 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb2(%44: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %45 = arith.addi %c36_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_21 = arith.constant 4 : i32
        %47 = "simt_step.switch"(%46, %c4_i32_21) ({
        ^bb0(%arg4: i32):
          %true_24 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %50 = arith.addi %c160_i32, %0 : i32
          %true_25 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%52: i32):  // no predecessors
          %53 = simt_step.subgroup_id
          %54 = arith.index_cast %53 : index to i32
          "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_22 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %48 = arith.addi %c176_i32, %0 : i32
        %true_23 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      %c192_i32 = arith.constant 192 : i32
      %28 = arith.addi %c192_i32, %0 : i32
      %true_7 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_8 = arith.constant true
      %c208_i32 = arith.constant 208 : i32
      %30 = arith.addi %c208_i32, %0 : i32
      %true_9 = arith.constant true
      %31 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb1(%32: i32):  // no predecessors
      %c0_i32_10 = arith.constant 0 : i32
      %c0_i32_11 = arith.constant 0 : i32
      %33:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %36 = arith.muli %arg4, %c4_i32_14 : i32
        %37 = arith.addi %36, %0 : i32
        %c40_i32 = arith.constant 40 : i32
        %38 = arith.addi %c40_i32, %37 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_15 : i32
        "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %36:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %43 = arith.muli %arg6, %c4_i32_19 : i32
          %44 = arith.addi %43, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %45 = arith.addi %c60_i32, %44 : i32
          %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %47 = arith.cmpi ne, %46, %c0_i32_20 : i32
          "simt_step.condition"(%47, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %43 = arith.addi %arg5, %arg6 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %44 = arith.addi %arg6, %c1_i32_19 : i32
          %true_20 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %45 = arith.muli %arg6, %c4_i32_21 : i32
          %46 = arith.addi %c224_i32, %45 : i32
          %47 = arith.addi %46, %0 : i32
          %true_22 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43, %44) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %37 = arith.addi %arg3, %36#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %38 = arith.addi %arg4, %c1_i32 : i32
        %true_16 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %c4_i32_17 = arith.constant 4 : i32
        %39 = arith.muli %arg4, %c4_i32_17 : i32
        %40 = arith.addi %c240_i32, %39 : i32
        %41 = arith.addi %40, %0 : i32
        %true_18 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37, %38) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%33#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%34: i32):  // no predecessors
      %c0_i32_12 = arith.constant 0 : i32
      %c0_i32_13 = arith.constant 0 : i32
      %35:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %36 = arith.muli %arg4, %c4_i32_14 : i32
        %37 = arith.addi %36, %0 : i32
        %c80_i32 = arith.constant 80 : i32
        %38 = arith.addi %c80_i32, %37 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_15 : i32
        "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c100_i32 = arith.constant 100 : i32
        %36 = arith.addi %c100_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_14 = arith.constant 4 : i32
        %38 = arith.addi %0, %c4_i32_14 : i32
        %39 = "simt_step.switch"(%37, %38) ({
        ^bb0(%arg5: i32):
          %c0_i32_20 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_20) {fallthrough = true} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          %c1_i32_21 = arith.constant 1 : i32
          %49 = arith.addi %0, %c1_i32_21 : i32
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        ^bb2(%50: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %51 = arith.addi %0, %c2_i32 : i32
          %true_22 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %52 = arith.addi %c256_i32, %0 : i32
          %true_23 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %40 = arith.addi %c272_i32, %0 : i32
        %true_16 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %42 = arith.addi %arg3, %39 : i32
        %c1_i32 = arith.constant 1 : i32
        %43 = arith.addi %arg4, %c1_i32 : i32
        %true_17 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %c4_i32_18 = arith.constant 4 : i32
        %44 = arith.muli %arg4, %c4_i32_18 : i32
        %45 = arith.addi %c288_i32, %44 : i32
        %46 = arith.addi %45, %0 : i32
        %true_19 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42, %43) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%35#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c304_i32 = arith.constant 304 : i32
    %10 = arith.addi %c304_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c104_i32 = arith.constant 104 : i32
    %12 = arith.addi %c104_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %14 = arith.cmpi ne, %13, %c0_i32_1 : i32
    %15 = "simt_step.if"(%14) ({
      %c108_i32 = arith.constant 108 : i32
      %24 = arith.addi %c108_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_5 : i32
      %27 = "simt_step.if"(%26) ({
        %c112_i32 = arith.constant 112 : i32
        %30 = arith.addi %c112_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_7 : i32
        %33 = "simt_step.if"(%32) ({
          %c0_i32_9 = arith.constant 0 : i32
          %36 = arith.addi %0, %c0_i32_9 : i32
          "simt_step.yield"(%36) : (i32) -> ()
        }, {
          %36 = simt_step.lane_id
          %37 = arith.index_cast %36 : index to i32
          "simt_step.yield"(%37) : (i32) -> ()
        }) : (i1) -> i32
        %c320_i32 = arith.constant 320 : i32
        %34 = arith.addi %c320_i32, %0 : i32
        %true_8 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) : (i32) -> ()
      }, {
        %c116_i32 = arith.constant 116 : i32
        %30 = arith.addi %c116_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %32 = simt_step.subgroup_id
        %33 = arith.index_cast %32 : index to i32
        %34 = "simt_step.switch"(%31, %33) ({
        ^bb0(%arg2: i32):
          %37 = simt_step.subgroup_id
          %38 = arith.index_cast %37 : index to i32
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %c0_i32_9 = arith.constant 0 : i32
          %40 = arith.addi %0, %c0_i32_9 : i32
          %true_10 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %41 = arith.addi %c336_i32, %0 : i32
          %true_11 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        ^bb2(%43: i32):  // no predecessors
          %c4_i32_12 = arith.constant 4 : i32
          %true_13 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %44 = arith.addi %c352_i32, %0 : i32
          %true_14 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_12) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        %c368_i32 = arith.constant 368 : i32
        %35 = arith.addi %c368_i32, %0 : i32
        %true_8 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34) : (i32) -> ()
      }) : (i1) -> i32
      %c384_i32 = arith.constant 384 : i32
      %28 = arith.addi %c384_i32, %0 : i32
      %true_6 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%27) : (i32) -> ()
    }, {
      %c120_i32 = arith.constant 120 : i32
      %24 = arith.addi %c120_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %26 = arith.addi %0, %c0_i32_5 : i32
      %27 = "simt_step.switch"(%25, %26) ({
      ^bb0(%arg2: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_12 : i32
          %36 = arith.addi %35, %0 : i32
          %c124_i32 = arith.constant 124 : i32
          %37 = arith.addi %c124_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_13 : i32
          "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %35 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %arg4, %c1_i32 : i32
          %true_12 = arith.constant true
          %c400_i32 = arith.constant 400 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %37 = arith.muli %arg4, %c4_i32_13 : i32
          %38 = arith.addi %c400_i32, %37 : i32
          %39 = arith.addi %38, %0 : i32
          %true_14 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %32 = arith.addi %0, %c3_i32 : i32
        %true_10 = arith.constant true
        %c416_i32 = arith.constant 416 : i32
        %33 = arith.addi %c416_i32, %0 : i32
        %true_11 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      %c432_i32 = arith.constant 432 : i32
      %28 = arith.addi %c432_i32, %0 : i32
      %true_7 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%27) : (i32) -> ()
    }) : (i1) -> i32
    %c448_i32 = arith.constant 448 : i32
    %16 = arith.addi %c448_i32, %0 : i32
    %true_2 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c144_i32 = arith.constant 144 : i32
    %18 = arith.addi %c144_i32, %0 : i32
    %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %20 = arith.cmpi ne, %19, %c0_i32_3 : i32
    %21 = "simt_step.if"(%20) ({
      %c148_i32 = arith.constant 148 : i32
      %24 = arith.addi %c148_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %26 = "simt_step.switch"(%25, %0) ({
      ^bb0(%arg2: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %31 = arith.muli %arg4, %c4_i32_9 : i32
          %32 = arith.addi %31, %0 : i32
          %c152_i32 = arith.constant 152 : i32
          %33 = arith.addi %c152_i32, %32 : i32
          %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %35 = arith.cmpi ne, %34, %c0_i32_10 : i32
          "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %31 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %arg4, %c1_i32 : i32
          %true_9 = arith.constant true
          %c464_i32 = arith.constant 464 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %33 = arith.muli %arg4, %c4_i32_10 : i32
          %34 = arith.addi %c464_i32, %33 : i32
          %35 = arith.addi %34, %0 : i32
          %true_11 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%27#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%28: i32):  // no predecessors
        %true_7 = arith.constant true
        %c480_i32 = arith.constant 480 : i32
        %29 = arith.addi %c480_i32, %0 : i32
        %true_8 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%26) : (i32) -> ()
    }, {
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %24:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %25 = arith.muli %arg3, %c4_i32_7 : i32
        %26 = arith.addi %25, %0 : i32
        %c172_i32 = arith.constant 172 : i32
        %27 = arith.addi %c172_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_8 : i32
        "simt_step.condition"(%29, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %25 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %arg3, %c1_i32 : i32
        %true_7 = arith.constant true
        %c496_i32 = arith.constant 496 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %27 = arith.muli %arg3, %c4_i32_8 : i32
        %28 = arith.addi %c496_i32, %27 : i32
        %29 = arith.addi %28, %0 : i32
        %true_9 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%24#0) : (i32) -> ()
    }) : (i1) -> i32
    %c512_i32 = arith.constant 512 : i32
    %22 = arith.addi %c512_i32, %0 : i32
    %true_4 = arith.constant true
    %23 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

