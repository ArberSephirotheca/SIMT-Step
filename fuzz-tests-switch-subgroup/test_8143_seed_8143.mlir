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
      %5 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %5, %c1_i32 : i32
      %7 = arith.cmpi slt, %arg5, %6 : i32
      "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c3_i32 = arith.constant 3 : i32
      %5 = arith.remsi %arg3, %c3_i32 : i32
      %6 = "simt_step.switch"(%5, %arg0) ({
      ^bb0(%arg6: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %9 = "simt_step.if"(%8) ({
          %true_6 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %19 = arith.muli %arg5, %c4_i32_7 : i32
          %20 = arith.addi %c16_i32, %19 : i32
          %21 = arith.addi %20, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) : (i32) -> ()
        }, {
          %true_6 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %19 = arith.muli %arg5, %c4_i32_7 : i32
          %20 = arith.addi %c32_i32, %19 : i32
          %21 = arith.addi %20, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
      ^bb1(%10: i32):  // no predecessors
        %true_4 = arith.constant true
        %11 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %c4_i32 = arith.constant 4 : i32
        %12 = arith.muli %arg5, %c4_i32 : i32
        %13 = arith.addi %c48_i32, %12 : i32
        %14 = arith.addi %13, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %14, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
      ^bb2(%15: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %17 = "simt_step.if"(%16) ({
          %true_6 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %19 = arith.muli %arg5, %c4_i32_7 : i32
          %20 = arith.addi %c64_i32, %19 : i32
          %21 = arith.addi %20, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) : (i32) -> ()
        }, {
          %true_6 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %19 = arith.muli %arg5, %c4_i32_7 : i32
          %20 = arith.addi %c80_i32, %19 : i32
          %21 = arith.addi %20, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %7 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.break"(%6, %7) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %0, %2#0 : i32
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
    %c3_i32 = arith.constant 3 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_2 = arith.constant 4 : i32
      %11 = arith.muli %arg3, %c4_i32_2 : i32
      %12 = arith.addi %11, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %13 = arith.addi %c8_i32, %12 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_3 : i32
      "simt_step.condition"(%15, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %11 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c96_i32 = arith.constant 96 : i32
      %c4_i32_2 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_2 : i32
      %14 = arith.addi %c96_i32, %13 : i32
      %15 = arith.addi %14, %0 : i32
      %true_3 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11, %12) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c28_i32 = arith.constant 28 : i32
    %6 = arith.addi %c28_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.lane_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c32_i32 = arith.constant 32 : i32
      %11 = arith.addi %c32_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_2 : i32
      %14 = "simt_step.if"(%13) ({
        %c36_i32 = arith.constant 36 : i32
        %43 = arith.addi %c36_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32_13 = arith.constant 3 : i32
        %45 = arith.addi %0, %c3_i32_13 : i32
        %46 = "simt_step.switch"(%44, %45) ({
        ^bb0(%arg3: i32):
          %49 = simt_step.lane_id
          %50 = arith.index_cast %49 : index to i32
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        ^bb1(%51: i32):  // no predecessors
          %52 = simt_step.subgroup_id
          %53 = arith.index_cast %52 : index to i32
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        ^bb2(%54: i32):  // no predecessors
          %c3_i32_16 = arith.constant 3 : i32
          %55 = arith.addi %0, %c3_i32_16 : i32
          "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
        ^bb3(%56: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %57 = arith.addi %0, %c2_i32 : i32
          %true_17 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %58 = arith.addi %c112_i32, %0 : i32
          %true_18 = arith.constant true
          %59 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %47 = arith.addi %c128_i32, %0 : i32
        %true_15 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46) : (i32) -> ()
      }, {
        %c40_i32 = arith.constant 40 : i32
        %43 = arith.addi %c40_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %45 = "simt_step.switch"(%44, %c0_i32_13) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %0, %c1_i32 : i32
          %true_14 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %48 = arith.addi %c144_i32, %0 : i32
          %true_15 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        ^bb2(%50: i32):  // no predecessors
          %51 = simt_step.subgroup_id
          %52 = arith.index_cast %51 : index to i32
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%45) : (i32) -> ()
      }) : (i1) -> i32
      %c160_i32 = arith.constant 160 : i32
      %15 = arith.addi %c160_i32, %0 : i32
      %true = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_3 = arith.constant true
      %c176_i32 = arith.constant 176 : i32
      %17 = arith.addi %c176_i32, %0 : i32
      %true_4 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %c44_i32 = arith.constant 44 : i32
      %20 = arith.addi %c44_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_5 : i32
      %23 = "simt_step.if"(%22) ({
        %c48_i32 = arith.constant 48 : i32
        %43 = arith.addi %c48_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %45 = arith.cmpi ne, %44, %c0_i32_13 : i32
        %46 = "simt_step.if"(%45) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c4_i32_15 = arith.constant 4 : i32
          %49 = arith.addi %0, %c4_i32_15 : i32
          "simt_step.yield"(%49) : (i32) -> ()
        }) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %47 = arith.addi %c192_i32, %0 : i32
        %true_14 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46) : (i32) -> ()
      }, {
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %44 = arith.muli %arg4, %c4_i32_15 : i32
          %45 = arith.addi %44, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %46 = arith.addi %c52_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_16 : i32
          "simt_step.condition"(%48, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %44 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %45 = arith.addi %arg4, %c1_i32 : i32
          %true_15 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %46 = arith.muli %arg4, %c4_i32_16 : i32
          %47 = arith.addi %c208_i32, %46 : i32
          %48 = arith.addi %47, %0 : i32
          %true_17 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%43#0) : (i32) -> ()
      }) : (i1) -> i32
      %c224_i32 = arith.constant 224 : i32
      %24 = arith.addi %c224_i32, %0 : i32
      %true_6 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      %c72_i32 = arith.constant 72 : i32
      %27 = arith.addi %c72_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %29 = simt_step.subgroup_id
      %30 = arith.index_cast %29 : index to i32
      %31 = "simt_step.switch"(%28, %30) ({
      ^bb0(%arg3: i32):
        %c76_i32 = arith.constant 76 : i32
        %43 = arith.addi %c76_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %45 = simt_step.lane_id
        %46 = arith.index_cast %45 : index to i32
        %47 = "simt_step.switch"(%44, %46) ({
        ^bb0(%arg4: i32):
          %61 = simt_step.lane_id
          %62 = arith.index_cast %61 : index to i32
          %true_24 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %63 = arith.addi %c240_i32, %0 : i32
          %true_25 = arith.constant true
          %64 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %63, %64) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%62) {fallthrough = false} : (i32) -> ()
        ^bb1(%65: i32):  // no predecessors
          %66 = simt_step.subgroup_id
          %67 = arith.index_cast %66 : index to i32
          "simt_step.yield"(%67) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %48 = arith.addi %c256_i32, %0 : i32
        %true_14 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_15 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %50 = arith.addi %c272_i32, %0 : i32
        %true_16 = arith.constant true
        %51 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
      ^bb1(%52: i32):  // no predecessors
        %c1_i32 = arith.constant 1 : i32
        %53 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
      ^bb2(%54: i32):  // no predecessors
        %c1_i32_17 = arith.constant 1 : i32
        %true_18 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %55 = arith.addi %c288_i32, %0 : i32
        %true_19 = arith.constant true
        %56 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c1_i32_17) {fallthrough = false} : (i32) -> ()
      ^bb3(%57: i32):  // no predecessors
        %c0_i32_20 = arith.constant 0 : i32
        %c0_i32_21 = arith.constant 0 : i32
        %58:2 = "simt_step.loop"(%c0_i32_20, %c0_i32_21) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_24 = arith.constant 4 : i32
          %61 = arith.muli %arg5, %c4_i32_24 : i32
          %62 = arith.addi %61, %0 : i32
          %c80_i32 = arith.constant 80 : i32
          %63 = arith.addi %c80_i32, %62 : i32
          %64 = "simt_step.buffer.load"(%arg1, %63) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_25 = arith.constant 0 : i32
          %65 = arith.cmpi ne, %64, %c0_i32_25 : i32
          "simt_step.condition"(%65, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %61 = arith.addi %arg4, %arg5 : i32
          %c1_i32_24 = arith.constant 1 : i32
          %62 = arith.addi %arg5, %c1_i32_24 : i32
          %true_25 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %c4_i32_26 = arith.constant 4 : i32
          %63 = arith.muli %arg5, %c4_i32_26 : i32
          %64 = arith.addi %c304_i32, %63 : i32
          %65 = arith.addi %64, %0 : i32
          %true_27 = arith.constant true
          %66 = "simt_step.wave_count_bits"(%true_27) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %65, %66) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%61, %62) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_22 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %59 = arith.addi %c320_i32, %0 : i32
        %true_23 = arith.constant true
        %60 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%58#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      %c336_i32 = arith.constant 336 : i32
      %32 = arith.addi %c336_i32, %0 : i32
      %true_8 = arith.constant true
      %33 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    ^bb3(%34: i32):  // no predecessors
      %c100_i32 = arith.constant 100 : i32
      %35 = arith.addi %c100_i32, %0 : i32
      %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %37 = arith.cmpi ne, %36, %c0_i32_9 : i32
      %38 = "simt_step.if"(%37) ({
        %c104_i32 = arith.constant 104 : i32
        %43 = arith.addi %c104_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %45 = "simt_step.switch"(%44, %0) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          %c0_i32_13 = arith.constant 0 : i32
          %true_14 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %47 = arith.addi %c352_i32, %0 : i32
          %true_15 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%45) : (i32) -> ()
      }, {
        %c108_i32 = arith.constant 108 : i32
        %43 = arith.addi %c108_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %45 = simt_step.lane_id
        %46 = arith.index_cast %45 : index to i32
        %47 = "simt_step.switch"(%44, %46) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          %c3_i32_13 = arith.constant 3 : i32
          %true_14 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %49 = arith.addi %c368_i32, %0 : i32
          %true_15 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32_13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%47) : (i32) -> ()
      }) : (i1) -> i32
      %c384_i32 = arith.constant 384 : i32
      %39 = arith.addi %c384_i32, %0 : i32
      %true_10 = arith.constant true
      %40 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_11 = arith.constant true
      %c400_i32 = arith.constant 400 : i32
      %41 = arith.addi %c400_i32, %0 : i32
      %true_12 = arith.constant true
      %42 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    return
  }
}

