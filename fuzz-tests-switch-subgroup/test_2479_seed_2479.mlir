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
      %c0_i32_2 = arith.constant 0 : i32
      %6 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %7 = "simt_step.if"(%6) ({
        %c2_i32 = arith.constant 2 : i32
        %8 = arith.remsi %arg3, %c2_i32 : i32
        %c4_i32 = arith.constant 4 : i32
        %9 = "simt_step.switch"(%8, %c4_i32) ({
        ^bb0(%arg4: i32):
          %true_3 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %11 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
        ^bb1(%12: i32):  // no predecessors
          %true_4 = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %14 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%9) : (i32) -> ()
      }, {
        %c0_i32_3 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %9 = "simt_step.if"(%8) ({
          %true_4 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %11 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) : (i32) -> ()
        }, {
          %true_4 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %11 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%9) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%7) : (i32) -> ()
    }, {
      %true_2 = arith.constant true
      %6 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      %c80_i32 = arith.constant 80 : i32
      %7 = arith.addi %c80_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%6) : (i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %7 = "simt_step.switch"(%6, %c0_i32_0) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %17 = arith.addi %c12_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_6 : i32
      %20 = "simt_step.if"(%19) ({
        %c16_i32 = arith.constant 16 : i32
        %41 = arith.addi %c16_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_16 : i32
        %44 = "simt_step.if"(%43) ({
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%47) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %45 = arith.addi %c96_i32, %0 : i32
        %true_17 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) : (i32) -> ()
      }, {
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %41:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %42 = arith.muli %arg4, %c4_i32_18 : i32
          %43 = arith.addi %42, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %44 = arith.addi %c20_i32, %43 : i32
          %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %46 = arith.cmpi ne, %45, %c0_i32_19 : i32
          "simt_step.condition"(%46, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %42 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %43 = arith.addi %arg4, %c1_i32 : i32
          %true_18 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %44 = arith.muli %arg4, %c4_i32_19 : i32
          %45 = arith.addi %c112_i32, %44 : i32
          %46 = arith.addi %45, %0 : i32
          %true_20 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%42, %43) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%41#0) : (i32) -> ()
      }) : (i1) -> i32
      %c128_i32 = arith.constant 128 : i32
      %21 = arith.addi %c128_i32, %0 : i32
      %true_7 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %24 = arith.addi %c40_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_8 : i32
      %27 = "simt_step.if"(%26) ({
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %41:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %42 = arith.muli %arg4, %c4_i32_18 : i32
          %43 = arith.addi %42, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %44 = arith.addi %c44_i32, %43 : i32
          %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %46 = arith.cmpi ne, %45, %c0_i32_19 : i32
          "simt_step.condition"(%46, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %42 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %43 = arith.addi %arg4, %c1_i32 : i32
          %true_18 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %44 = arith.muli %arg4, %c4_i32_19 : i32
          %45 = arith.addi %c144_i32, %44 : i32
          %46 = arith.addi %45, %0 : i32
          %true_20 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42, %43) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%41#0) : (i32) -> ()
      }, {
        %c64_i32 = arith.constant 64 : i32
        %41 = arith.addi %c64_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_16 : i32
        %44 = "simt_step.if"(%43) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c2_i32_18 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_18) : (i32) -> ()
        }) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %45 = arith.addi %c160_i32, %0 : i32
        %true_17 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) : (i32) -> ()
      }) : (i1) -> i32
      %c176_i32 = arith.constant 176 : i32
      %28 = arith.addi %c176_i32, %0 : i32
      %true_9 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_10 = arith.constant true
      %c192_i32 = arith.constant 192 : i32
      %30 = arith.addi %c192_i32, %0 : i32
      %true_11 = arith.constant true
      %31 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb2(%32: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %33 = arith.addi %c68_i32, %0 : i32
      %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %35 = arith.addi %0, %c2_i32 : i32
      %36 = "simt_step.switch"(%34, %35) ({
      ^bb0(%arg3: i32):
        %c72_i32 = arith.constant 72 : i32
        %41 = arith.addi %c72_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_16 : i32
        %44 = "simt_step.if"(%43) ({
          %56 = simt_step.lane_id
          %57 = arith.index_cast %56 : index to i32
          "simt_step.yield"(%57) : (i32) -> ()
        }, {
          %56 = simt_step.lane_id
          %57 = arith.index_cast %56 : index to i32
          "simt_step.yield"(%57) : (i32) -> ()
        }) : (i1) -> i32
        %c208_i32 = arith.constant 208 : i32
        %45 = arith.addi %c208_i32, %0 : i32
        %true_17 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_18 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %47 = arith.addi %c224_i32, %0 : i32
        %true_19 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      ^bb1(%49: i32):  // no predecessors
        %c76_i32 = arith.constant 76 : i32
        %50 = arith.addi %c76_i32, %0 : i32
        %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32_20 = arith.constant 2 : i32
        %52 = arith.addi %0, %c2_i32_20 : i32
        %53 = "simt_step.switch"(%51, %52) ({
        ^bb0(%arg4: i32):
          %56 = simt_step.lane_id
          %57 = arith.index_cast %56 : index to i32
          "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
        ^bb1(%58: i32):  // no predecessors
          %59 = simt_step.lane_id
          %60 = arith.index_cast %59 : index to i32
          %true_23 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %61 = arith.addi %c240_i32, %0 : i32
          %true_24 = arith.constant true
          %62 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%60) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_21 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %54 = arith.addi %c256_i32, %0 : i32
        %true_22 = arith.constant true
        %55 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_12 = arith.constant true
      %c272_i32 = arith.constant 272 : i32
      %37 = arith.addi %c272_i32, %0 : i32
      %true_13 = arith.constant true
      %38 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
    ^bb3(%39: i32):  // no predecessors
      %c0_i32_14 = arith.constant 0 : i32
      %c0_i32_15 = arith.constant 0 : i32
      %40:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_16 = arith.constant 4 : i32
        %41 = arith.muli %arg4, %c4_i32_16 : i32
        %42 = arith.addi %41, %0 : i32
        %c80_i32 = arith.constant 80 : i32
        %43 = arith.addi %c80_i32, %42 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %45 = arith.cmpi ne, %44, %c0_i32_17 : i32
        "simt_step.condition"(%45, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %41 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %42 = arith.addi %arg4, %c1_i32 : i32
        %true_16 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %c4_i32_17 = arith.constant 4 : i32
        %43 = arith.muli %arg4, %c4_i32_17 : i32
        %44 = arith.addi %c288_i32, %43 : i32
        %45 = arith.addi %44, %0 : i32
        %true_18 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41, %42) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%40#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c304_i32 = arith.constant 304 : i32
    %8 = arith.addi %c304_i32, %0 : i32
    %true_1 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c100_i32 = arith.constant 100 : i32
    %10 = arith.addi %c100_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %12 = arith.cmpi ne, %11, %c0_i32_2 : i32
    %13 = "simt_step.if"(%12) ({
      %c104_i32 = arith.constant 104 : i32
      %17 = arith.addi %c104_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %19 = "simt_step.switch"(%18, %0) ({
      ^bb0(%arg2: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %20:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %29 = arith.muli %arg4, %c4_i32_12 : i32
          %30 = arith.addi %29, %0 : i32
          %c108_i32 = arith.constant 108 : i32
          %31 = arith.addi %c108_i32, %30 : i32
          %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %33 = arith.cmpi ne, %32, %c0_i32_13 : i32
          "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %29 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %30 = arith.addi %arg4, %c1_i32 : i32
          %true_12 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %31 = arith.muli %arg4, %c4_i32_13 : i32
          %32 = arith.addi %c320_i32, %31 : i32
          %33 = arith.addi %32, %0 : i32
          %true_14 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%29, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%20#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%21: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %29 = arith.muli %arg4, %c4_i32_12 : i32
          %30 = arith.addi %29, %0 : i32
          %c128_i32 = arith.constant 128 : i32
          %31 = arith.addi %c128_i32, %30 : i32
          %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %33 = arith.cmpi ne, %32, %c0_i32_13 : i32
          "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %29 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %30 = arith.addi %arg4, %c1_i32 : i32
          %true_12 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %31 = arith.muli %arg4, %c4_i32_13 : i32
          %32 = arith.addi %c336_i32, %31 : i32
          %33 = arith.addi %32, %0 : i32
          %true_14 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_10 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %23 = arith.addi %c352_i32, %0 : i32
        %true_11 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%25: i32):  // no predecessors
        %c148_i32 = arith.constant 148 : i32
        %26 = arith.addi %c148_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %28 = "simt_step.switch"(%27, %0) ({
        ^bb0(%arg3: i32):
          %29 = simt_step.subgroup_id
          %30 = arith.index_cast %29 : index to i32
          "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
        ^bb1(%31: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %true_12 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %32 = arith.addi %c368_i32, %0 : i32
          %true_13 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32) {fallthrough = true} : (i32) -> ()
        ^bb2(%34: i32):  // no predecessors
          %35 = simt_step.lane_id
          %36 = arith.index_cast %35 : index to i32
          %true_14 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %37 = arith.addi %c384_i32, %0 : i32
          %true_15 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%19) : (i32) -> ()
    }, {
      %c2_i32 = arith.constant 2 : i32
      %17 = arith.addi %0, %c2_i32 : i32
      "simt_step.yield"(%17) : (i32) -> ()
    }) : (i1) -> i32
    %c400_i32 = arith.constant 400 : i32
    %14 = arith.addi %c400_i32, %0 : i32
    %true_3 = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_4 = arith.constant 0 : i32
    %c0_i32_5 = arith.constant 0 : i32
    %16:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %17 = arith.muli %arg3, %c4_i32_6 : i32
      %18 = arith.addi %17, %0 : i32
      %c152_i32 = arith.constant 152 : i32
      %19 = arith.addi %c152_i32, %18 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_7 : i32
      "simt_step.condition"(%21, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %17 = simt_step.subgroup_id
      %18 = arith.index_cast %17 : index to i32
      %19 = arith.addi %arg2, %18 : i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %arg3, %c1_i32 : i32
      %true_6 = arith.constant true
      %c416_i32 = arith.constant 416 : i32
      %c4_i32_7 = arith.constant 4 : i32
      %21 = arith.muli %arg3, %c4_i32_7 : i32
      %22 = arith.addi %c416_i32, %21 : i32
      %23 = arith.addi %22, %0 : i32
      %true_8 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19, %20) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

