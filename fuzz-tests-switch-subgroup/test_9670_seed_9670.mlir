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
      %1 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %2 = "simt_step.if"(%1) ({
        %true = arith.constant true
        %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %c4_i32 = arith.constant 4 : i32
        %5 = arith.muli %arg5, %c4_i32 : i32
        %6 = arith.addi %c0_i32_2, %5 : i32
        %7 = arith.addi %6, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %7, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%4) : (i32) -> ()
      }, {
        %4 = simt_step.lane_id
        %5 = arith.index_cast %4 : index to i32
        %6 = "simt_step.switch"(%arg3, %5) ({
        ^bb0(%arg6: i32):
          %true = arith.constant true
          %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %8 = arith.muli %arg5, %c4_i32 : i32
          %9 = arith.addi %c16_i32, %8 : i32
          %10 = arith.addi %9, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %10, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
        ^bb1(%11: i32):  // no predecessors
          %true_2 = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_3 = arith.constant 4 : i32
          %13 = arith.muli %arg5, %c4_i32_3 : i32
          %14 = arith.addi %c32_i32, %13 : i32
          %15 = arith.addi %14, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%6) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      %3 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.break"(%2, %3) : (i32, i32) -> ()
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
    %c4_i32_0 = arith.constant 4 : i32
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %7 = arith.addi %0, %c1_i32 : i32
    %8 = "simt_step.switch"(%6, %7) ({
    ^bb0(%arg2: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_15 = arith.constant 4 : i32
        %34 = arith.muli %arg4, %c4_i32_15 : i32
        %35 = arith.addi %34, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %36 = arith.addi %c12_i32, %35 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_16 : i32
        "simt_step.condition"(%38, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c32_i32 = arith.constant 32 : i32
        %34 = arith.addi %c32_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_15 : i32
        %37 = "simt_step.if"(%36) ({
          %46 = simt_step.subgroup_id
          %47 = arith.index_cast %46 : index to i32
          "simt_step.yield"(%47) : (i32) -> ()
        }, {
          %46 = simt_step.lane_id
          %47 = arith.index_cast %46 : index to i32
          "simt_step.yield"(%47) : (i32) -> ()
        }) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %38 = arith.addi %c48_i32, %0 : i32
        %true_16 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %40 = arith.addi %arg3, %37 : i32
        %c1_i32_17 = arith.constant 1 : i32
        %41 = arith.addi %arg4, %c1_i32_17 : i32
        %true_18 = arith.constant true
        %c64_i32 = arith.constant 64 : i32
        %c4_i32_19 = arith.constant 4 : i32
        %42 = arith.muli %arg4, %c4_i32_19 : i32
        %43 = arith.addi %c64_i32, %42 : i32
        %44 = arith.addi %43, %0 : i32
        %true_20 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40, %41) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_5 = arith.constant true
      %c80_i32 = arith.constant 80 : i32
      %15 = arith.addi %c80_i32, %0 : i32
      %true_6 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c36_i32 = arith.constant 36 : i32
      %18 = arith.addi %c36_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_7 : i32
      %21 = "simt_step.if"(%20) ({
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_17 : i32
          %36 = arith.addi %35, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %37 = arith.addi %c40_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_18 : i32
          "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %35 = arith.addi %arg3, %arg4 : i32
          %c1_i32_17 = arith.constant 1 : i32
          %36 = arith.addi %arg4, %c1_i32_17 : i32
          %true_18 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %37 = arith.muli %arg4, %c4_i32_19 : i32
          %38 = arith.addi %c96_i32, %37 : i32
          %39 = arith.addi %38, %0 : i32
          %true_20 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%34#0) : (i32) -> ()
      }, {
        %34 = simt_step.subgroup_id
        %35 = arith.index_cast %34 : index to i32
        "simt_step.yield"(%35) : (i32) -> ()
      }) : (i1) -> i32
      %c112_i32 = arith.constant 112 : i32
      %22 = arith.addi %c112_i32, %0 : i32
      %true_8 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_9 = arith.constant true
      %c128_i32 = arith.constant 128 : i32
      %24 = arith.addi %c128_i32, %0 : i32
      %true_10 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      %c60_i32 = arith.constant 60 : i32
      %27 = arith.addi %c60_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %29 = "simt_step.switch"(%28, %c2_i32) ({
      ^bb0(%arg3: i32):
        %c64_i32 = arith.constant 64 : i32
        %34 = arith.addi %c64_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %36 = "simt_step.switch"(%35, %0) ({
        ^bb0(%arg4: i32):
          %62 = simt_step.subgroup_id
          %63 = arith.index_cast %62 : index to i32
          %true_25 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %64 = arith.addi %c144_i32, %0 : i32
          %true_26 = arith.constant true
          %65 = "simt_step.wave_count_bits"(%true_26) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %64, %65) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%63) {fallthrough = false} : (i32) -> ()
        ^bb1(%66: i32):  // no predecessors
          %c2_i32_27 = arith.constant 2 : i32
          %67 = arith.addi %0, %c2_i32_27 : i32
          "simt_step.yield"(%67) {fallthrough = false} : (i32) -> ()
        ^bb2(%68: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb1(%37: i32):  // no predecessors
        %c68_i32 = arith.constant 68 : i32
        %38 = arith.addi %c68_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %40 = simt_step.subgroup_id
        %41 = arith.index_cast %40 : index to i32
        %42 = "simt_step.switch"(%39, %41) ({
        ^bb0(%arg4: i32):
          %c0_i32_25 = arith.constant 0 : i32
          %true_26 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %62 = arith.addi %c160_i32, %0 : i32
          %true_27 = arith.constant true
          %63 = "simt_step.wave_count_bits"(%true_27) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_25) {fallthrough = false} : (i32) -> ()
        ^bb1(%64: i32):  // no predecessors
          %c2_i32_28 = arith.constant 2 : i32
          %true_29 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %65 = arith.addi %c176_i32, %0 : i32
          %true_30 = arith.constant true
          %66 = "simt_step.wave_count_bits"(%true_30) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %65, %66) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32_28) {fallthrough = false} : (i32) -> ()
        ^bb2(%67: i32):  // no predecessors
          %c2_i32_31 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_31) {fallthrough = true} : (i32) -> ()
        ^bb3(%68: i32):  // no predecessors
          %c1_i32_32 = arith.constant 1 : i32
          %69 = arith.addi %0, %c1_i32_32 : i32
          %true_33 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %70 = arith.addi %c192_i32, %0 : i32
          %true_34 = arith.constant true
          %71 = "simt_step.wave_count_bits"(%true_34) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %70, %71) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%69) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %43 = arith.addi %c208_i32, %0 : i32
        %true_16 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
      ^bb2(%45: i32):  // no predecessors
        %c72_i32 = arith.constant 72 : i32
        %46 = arith.addi %c72_i32, %0 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %48 = arith.cmpi ne, %47, %c0_i32_17 : i32
        %49 = "simt_step.if"(%48) ({
          %62 = simt_step.subgroup_id
          %63 = arith.index_cast %62 : index to i32
          "simt_step.yield"(%63) : (i32) -> ()
        }, {
          %c4_i32_25 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_25) : (i32) -> ()
        }) : (i1) -> i32
        %c224_i32 = arith.constant 224 : i32
        %50 = arith.addi %c224_i32, %0 : i32
        %true_18 = arith.constant true
        %51 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_19 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %52 = arith.addi %c240_i32, %0 : i32
        %true_20 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
      ^bb3(%54: i32):  // no predecessors
        %c76_i32 = arith.constant 76 : i32
        %55 = arith.addi %c76_i32, %0 : i32
        %56 = "simt_step.buffer.load"(%arg1, %55) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %57 = "simt_step.switch"(%56, %c3_i32) ({
        ^bb0(%arg4: i32):
          %62 = simt_step.subgroup_id
          %63 = arith.index_cast %62 : index to i32
          "simt_step.yield"(%63) {fallthrough = false} : (i32) -> ()
        ^bb1(%64: i32):  // no predecessors
          %65 = simt_step.subgroup_id
          %66 = arith.index_cast %65 : index to i32
          %true_25 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %67 = arith.addi %c256_i32, %0 : i32
          %true_26 = arith.constant true
          %68 = "simt_step.wave_count_bits"(%true_26) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %67, %68) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%66) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_21 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %58 = arith.addi %c272_i32, %0 : i32
        %true_22 = arith.constant true
        %59 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_23 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %60 = arith.addi %c288_i32, %0 : i32
        %true_24 = arith.constant true
        %61 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_11 = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %30 = arith.addi %c304_i32, %0 : i32
      %true_12 = arith.constant true
      %31 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    ^bb3(%32: i32):  // no predecessors
      %c0_i32_13 = arith.constant 0 : i32
      %c0_i32_14 = arith.constant 0 : i32
      %33:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_15 = arith.constant 4 : i32
        %34 = arith.muli %arg4, %c4_i32_15 : i32
        %35 = arith.addi %34, %0 : i32
        %c80_i32_16 = arith.constant 80 : i32
        %36 = arith.addi %c80_i32_16, %35 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_17 : i32
        "simt_step.condition"(%38, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c100_i32 = arith.constant 100 : i32
        %34 = arith.addi %c100_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_15 : i32
        %37 = "simt_step.if"(%36) ({
          %46 = simt_step.subgroup_id
          %47 = arith.index_cast %46 : index to i32
          "simt_step.yield"(%47) : (i32) -> ()
        }, {
          %c1_i32_21 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_21) : (i32) -> ()
        }) : (i1) -> i32
        %c320_i32 = arith.constant 320 : i32
        %38 = arith.addi %c320_i32, %0 : i32
        %true_16 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %40 = arith.addi %arg3, %37 : i32
        %c1_i32_17 = arith.constant 1 : i32
        %41 = arith.addi %arg4, %c1_i32_17 : i32
        %true_18 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %c4_i32_19 = arith.constant 4 : i32
        %42 = arith.muli %arg4, %c4_i32_19 : i32
        %43 = arith.addi %c336_i32, %42 : i32
        %44 = arith.addi %43, %0 : i32
        %true_20 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%40, %41) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%33#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c352_i32 = arith.constant 352 : i32
    %9 = arith.addi %c352_i32, %0 : i32
    %true_1 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c104_i32 = arith.constant 104 : i32
    %11 = arith.addi %c104_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32_2 = arith.constant 1 : i32
    %13 = "simt_step.switch"(%12, %c1_i32_2) ({
    ^bb0(%arg2: i32):
      %c108_i32 = arith.constant 108 : i32
      %14 = arith.addi %c108_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %16 = "simt_step.switch"(%15, %0) ({
      ^bb0(%arg3: i32):
        %c112_i32 = arith.constant 112 : i32
        %26 = arith.addi %c112_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %28 = arith.addi %0, %c0_i32_7 : i32
        %29 = "simt_step.switch"(%27, %28) ({
        ^bb0(%arg4: i32):
          %c1_i32_19 = arith.constant 1 : i32
          %49 = arith.addi %0, %c1_i32_19 : i32
          %true_20 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %50 = arith.addi %c368_i32, %0 : i32
          %true_21 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        ^bb1(%52: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%53: i32):  // no predecessors
          %54 = simt_step.subgroup_id
          %55 = arith.index_cast %54 : index to i32
          "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %c384_i32 = arith.constant 384 : i32
        %30 = arith.addi %c384_i32, %0 : i32
        %true_9 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c116_i32 = arith.constant 116 : i32
        %33 = arith.addi %c116_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_10 = arith.constant 1 : i32
        %35 = "simt_step.switch"(%34, %c1_i32_10) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%49: i32):  // no predecessors
          %50 = simt_step.lane_id
          %51 = arith.index_cast %50 : index to i32
          %true_19 = arith.constant true
          %c400_i32 = arith.constant 400 : i32
          %52 = arith.addi %c400_i32, %0 : i32
          %true_20 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        ^bb2(%54: i32):  // no predecessors
          %c0_i32_21 = arith.constant 0 : i32
          %true_22 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %55 = arith.addi %c416_i32, %0 : i32
          %true_23 = arith.constant true
          %56 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_21) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      ^bb2(%36: i32):  // no predecessors
        %c120_i32 = arith.constant 120 : i32
        %37 = arith.addi %c120_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_11 : i32
        %40 = "simt_step.if"(%39) ({
          %49 = simt_step.lane_id
          %50 = arith.index_cast %49 : index to i32
          "simt_step.yield"(%50) : (i32) -> ()
        }, {
          %c4_i32_19 = arith.constant 4 : i32
          %49 = arith.addi %0, %c4_i32_19 : i32
          "simt_step.yield"(%49) : (i32) -> ()
        }) : (i1) -> i32
        %c432_i32 = arith.constant 432 : i32
        %41 = arith.addi %c432_i32, %0 : i32
        %true_12 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_13 = arith.constant true
        %c448_i32 = arith.constant 448 : i32
        %43 = arith.addi %c448_i32, %0 : i32
        %true_14 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      ^bb3(%45: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %46:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %49 = arith.muli %arg5, %c4_i32_19 : i32
          %50 = arith.addi %49, %0 : i32
          %c124_i32 = arith.constant 124 : i32
          %51 = arith.addi %c124_i32, %50 : i32
          %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %53 = arith.cmpi ne, %52, %c0_i32_20 : i32
          "simt_step.condition"(%53, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %49 = arith.addi %arg4, %arg5 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %50 = arith.addi %arg5, %c1_i32_19 : i32
          %true_20 = arith.constant true
          %c464_i32 = arith.constant 464 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %51 = arith.muli %arg5, %c4_i32_21 : i32
          %52 = arith.addi %c464_i32, %51 : i32
          %53 = arith.addi %52, %0 : i32
          %true_22 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%49, %50) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_17 = arith.constant true
        %c480_i32 = arith.constant 480 : i32
        %47 = arith.addi %c480_i32, %0 : i32
        %true_18 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c144_i32 = arith.constant 144 : i32
      %18 = arith.addi %c144_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_3 : i32
      %21 = "simt_step.if"(%20) ({
        %c148_i32 = arith.constant 148 : i32
        %26 = arith.addi %c148_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_7 : i32
        %29 = "simt_step.if"(%28) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %32 = simt_step.lane_id
          %33 = arith.index_cast %32 : index to i32
          "simt_step.yield"(%33) : (i32) -> ()
        }) : (i1) -> i32
        %c496_i32 = arith.constant 496 : i32
        %30 = arith.addi %c496_i32, %0 : i32
        %true_8 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29) : (i32) -> ()
      }, {
        %c152_i32 = arith.constant 152 : i32
        %26 = arith.addi %c152_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %28 = simt_step.lane_id
        %29 = arith.index_cast %28 : index to i32
        %30 = "simt_step.switch"(%27, %29) ({
        ^bb0(%arg3: i32):
          %c2_i32 = arith.constant 2 : i32
          %31 = arith.addi %0, %c2_i32 : i32
          %true_7 = arith.constant true
          %c512_i32 = arith.constant 512 : i32
          %32 = arith.addi %c512_i32, %0 : i32
          %true_8 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %35 = arith.addi %0, %c3_i32 : i32
          %true_9 = arith.constant true
          %c528_i32 = arith.constant 528 : i32
          %36 = arith.addi %c528_i32, %0 : i32
          %true_10 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        ^bb2(%38: i32):  // no predecessors
          %39 = simt_step.lane_id
          %40 = arith.index_cast %39 : index to i32
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        ^bb3(%41: i32):  // no predecessors
          %c0_i32_11 = arith.constant 0 : i32
          %42 = arith.addi %0, %c0_i32_11 : i32
          %true_12 = arith.constant true
          %c544_i32 = arith.constant 544 : i32
          %43 = arith.addi %c544_i32, %0 : i32
          %true_13 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%30) : (i32) -> ()
      }) : (i1) -> i32
      %c560_i32 = arith.constant 560 : i32
      %22 = arith.addi %c560_i32, %0 : i32
      %true_4 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_5 = arith.constant true
      %c576_i32 = arith.constant 576 : i32
      %24 = arith.addi %c576_i32, %0 : i32
      %true_6 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

