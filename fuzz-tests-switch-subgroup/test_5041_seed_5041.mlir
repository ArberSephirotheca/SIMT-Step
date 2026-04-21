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
      %true_2 = arith.constant true
      %6 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %7 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%6) : (i32) -> ()
    }, {
      %c2_i32 = arith.constant 2 : i32
      %6 = arith.remsi %arg3, %c2_i32 : i32
      %7 = "simt_step.switch"(%6, %arg0) ({
      ^bb0(%arg4: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %8:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %12 = arith.addi %11, %c1_i32 : i32
          %13 = arith.cmpi slt, %arg6, %12 : i32
          "simt_step.condition"(%13, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_6 = arith.constant true
          %11 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %12 = arith.muli %arg6, %c4_i32 : i32
          %13 = arith.addi %c32_i32, %12 : i32
          %14 = arith.addi %13, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %15 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.break"(%11, %15) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%8#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%9: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %10:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %12 = arith.addi %11, %c1_i32 : i32
          %13 = arith.cmpi slt, %arg6, %12 : i32
          "simt_step.condition"(%13, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_6 = arith.constant true
          %11 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32 = arith.constant 4 : i32
          %12 = arith.muli %arg6, %c4_i32 : i32
          %13 = arith.addi %c48_i32, %12 : i32
          %14 = arith.addi %13, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %15 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%11, %15) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%10#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%7) : (i32) -> ()
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
    %7 = simt_step.subgroup_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %12 = arith.addi %c12_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %14 = "simt_step.switch"(%13, %0) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %32 = arith.addi %c16_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_7 : i32
        %35 = "simt_step.if"(%34) ({
          %53 = simt_step.subgroup_id
          %54 = arith.index_cast %53 : index to i32
          "simt_step.yield"(%54) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %36 = arith.addi %c64_i32, %0 : i32
        %true_8 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        %39 = simt_step.subgroup_id
        %40 = arith.index_cast %39 : index to i32
        %true_9 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %41 = arith.addi %c80_i32, %0 : i32
        %true_10 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      ^bb2(%43: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %44 = arith.addi %c20_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %46 = arith.addi %0, %c0_i32_11 : i32
        %47 = "simt_step.switch"(%45, %46) ({
        ^bb0(%arg4: i32):
          %53 = simt_step.subgroup_id
          %54 = arith.index_cast %53 : index to i32
          "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
        ^bb1(%55: i32):  // no predecessors
          %true_17 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %56 = arith.addi %c96_i32, %0 : i32
          %true_18 = arith.constant true
          %57 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        %c112_i32 = arith.constant 112 : i32
        %48 = arith.addi %c112_i32, %0 : i32
        %true_13 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
      ^bb3(%50: i32):  // no predecessors
        %c2_i32_14 = arith.constant 2 : i32
        %true_15 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %51 = arith.addi %c128_i32, %0 : i32
        %true_16 = arith.constant true
        %52 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c2_i32_14) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c144_i32 = arith.constant 144 : i32
      %15 = arith.addi %c144_i32, %0 : i32
      %true_0 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_1 = arith.constant true
      %c160_i32 = arith.constant 160 : i32
      %17 = arith.addi %c160_i32, %0 : i32
      %true_2 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %c24_i32 = arith.constant 24 : i32
      %20 = arith.addi %c24_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %22 = "simt_step.switch"(%21, %c2_i32) ({
      ^bb0(%arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        %32 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      ^bb1(%33: i32):  // no predecessors
        %c28_i32 = arith.constant 28 : i32
        %34 = arith.addi %c28_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %36 = simt_step.subgroup_id
        %37 = arith.index_cast %36 : index to i32
        %38 = "simt_step.switch"(%35, %37) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%54: i32):  // no predecessors
          %c1_i32_14 = arith.constant 1 : i32
          %55 = arith.addi %0, %c1_i32_14 : i32
          "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
        ^bb2(%56: i32):  // no predecessors
          %57 = simt_step.lane_id
          %58 = arith.index_cast %57 : index to i32
          %true_15 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %59 = arith.addi %c176_i32, %0 : i32
          %true_16 = arith.constant true
          %60 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %39 = arith.addi %c192_i32, %0 : i32
        %true_8 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      ^bb2(%41: i32):  // no predecessors
        %c32_i32 = arith.constant 32 : i32
        %42 = arith.addi %c32_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_9 = arith.constant 4 : i32
        %44 = arith.addi %0, %c4_i32_9 : i32
        %45 = "simt_step.switch"(%43, %44) ({
        ^bb0(%arg4: i32):
          %c0_i32_14 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_14) {fallthrough = false} : (i32) -> ()
        ^bb1(%54: i32):  // no predecessors
          %c0_i32_15 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_15) {fallthrough = false} : (i32) -> ()
        ^bb2(%55: i32):  // no predecessors
          %56 = simt_step.lane_id
          %57 = arith.index_cast %56 : index to i32
          "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
        ^bb3(%58: i32):  // no predecessors
          %c2_i32_16 = arith.constant 2 : i32
          %true_17 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %59 = arith.addi %c208_i32, %0 : i32
          %true_18 = arith.constant true
          %60 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32_16) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %46 = arith.addi %c224_i32, %0 : i32
        %true_11 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      ^bb3(%48: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %49 = arith.addi %c36_i32, %0 : i32
        %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
        %51 = "simt_step.switch"(%50, %0) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%54: i32):  // no predecessors
          %55 = simt_step.lane_id
          %56 = arith.index_cast %55 : index to i32
          "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
        ^bb2(%57: i32):  // no predecessors
          %58 = simt_step.lane_id
          %59 = arith.index_cast %58 : index to i32
          %true_14 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %60 = arith.addi %c240_i32, %0 : i32
          %true_15 = arith.constant true
          %61 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%59) {fallthrough = false} : (i32) -> ()
        ^bb3(%62: i32):  // no predecessors
          %c0_i32_16 = arith.constant 0 : i32
          %63 = arith.addi %0, %c0_i32_16 : i32
          "simt_step.yield"(%63) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %52 = arith.addi %c256_i32, %0 : i32
        %true_13 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb2(%23: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %24 = arith.addi %c40_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_3 : i32
      %27 = "simt_step.if"(%26) ({
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %33 = arith.muli %arg4, %c4_i32_9 : i32
          %34 = arith.addi %33, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %35 = arith.addi %c44_i32, %34 : i32
          %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %37 = arith.cmpi ne, %36, %c0_i32_10 : i32
          "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %33 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %34 = arith.addi %arg4, %c1_i32 : i32
          %true_9 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_10 : i32
          %36 = arith.addi %c272_i32, %35 : i32
          %37 = arith.addi %36, %0 : i32
          %true_11 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%33, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%32#0) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %33 = arith.muli %arg4, %c4_i32_9 : i32
          %34 = arith.addi %33, %0 : i32
          %c64_i32 = arith.constant 64 : i32
          %35 = arith.addi %c64_i32, %34 : i32
          %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %37 = arith.cmpi ne, %36, %c0_i32_10 : i32
          "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %33 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %34 = arith.addi %arg4, %c1_i32 : i32
          %true_9 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_10 : i32
          %36 = arith.addi %c288_i32, %35 : i32
          %37 = arith.addi %36, %0 : i32
          %true_11 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%33, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%32#0) : (i32) -> ()
      }) : (i1) -> i32
      %c304_i32 = arith.constant 304 : i32
      %28 = arith.addi %c304_i32, %0 : i32
      %true_4 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_5 = arith.constant true
      %c320_i32 = arith.constant 320 : i32
      %30 = arith.addi %c320_i32, %0 : i32
      %true_6 = arith.constant true
      %31 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %10 = simt_step.subgroup_id
    %11 = arith.index_cast %10 : index to i32
    return
  }
}

