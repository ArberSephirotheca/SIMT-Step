module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c4_i32 = arith.constant 4 : i32
    %2 = arith.remsi %arg3, %c4_i32 : i32
    %3 = simt_step.subgroup_id
    %4 = arith.index_cast %3 : index to i32
    %5 = "simt_step.switch"(%2, %4) ({
    ^bb0(%arg4: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %10:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %19 = arith.remsi %arg3, %c4_i32_8 : i32
        %c1_i32 = arith.constant 1 : i32
        %20 = arith.addi %19, %c1_i32 : i32
        %21 = arith.cmpi slt, %arg6, %20 : i32
        "simt_step.condition"(%21, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %21 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %22 = arith.addi %21, %c1_i32_11 : i32
          %23 = arith.cmpi slt, %arg8, %22 : i32
          "simt_step.condition"(%23, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_10 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %22 = arith.muli %arg8, %c4_i32_11 : i32
          %23 = arith.addi %c16_i32, %22 : i32
          %24 = arith.addi %23, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_12 = arith.constant 1 : i32
          %25 = arith.addi %arg8, %c1_i32_12 : i32
          "simt_step.break"(%21, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %20 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%19#0, %20) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%10#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%11: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
      %13 = "simt_step.if"(%12) ({
        %true_8 = arith.constant true
        %19 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %20 = arith.addi %c32_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%19) : (i32) -> ()
      }, {
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32 : i32
          %22 = arith.cmpi slt, %arg6, %21 : i32
          "simt_step.condition"(%22, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_10 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %21 = arith.muli %arg6, %c4_i32_11 : i32
          %22 = arith.addi %c48_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %24 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%20, %24) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb2(%14: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
      %16 = "simt_step.if"(%15) ({
        %true_8 = arith.constant true
        %19 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %20 = arith.addi %c64_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%19) : (i32) -> ()
      }, {
        %true_8 = arith.constant true
        %19 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %20 = arith.addi %c80_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%19) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb3(%17: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %19 = arith.remsi %arg3, %c4_i32_8 : i32
        %c1_i32 = arith.constant 1 : i32
        %20 = arith.addi %19, %c1_i32 : i32
        %21 = arith.cmpi slt, %arg6, %20 : i32
        "simt_step.condition"(%21, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c3_i32 = arith.constant 3 : i32
        %19 = arith.remsi %arg3, %c3_i32 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %20 = arith.addi %arg0, %c4_i32_8 : i32
        %21 = "simt_step.switch"(%19, %20) ({
        ^bb0(%arg7: i32):
          %true_9 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %24 = arith.muli %arg6, %c4_i32_10 : i32
          %25 = arith.addi %c96_i32, %24 : i32
          %26 = arith.addi %25, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %true_11 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %29 = arith.muli %arg6, %c4_i32_12 : i32
          %30 = arith.addi %c112_i32, %29 : i32
          %31 = arith.addi %30, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = true} : (i32) -> ()
        ^bb2(%32: i32):  // no predecessors
          %true_13 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %34 = arith.muli %arg6, %c4_i32_14 : i32
          %35 = arith.addi %c128_i32, %34 : i32
          %36 = arith.addi %35, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.break"(%21, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%18#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_0 = arith.constant true
    %6 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    %c144_i32 = arith.constant 144 : i32
    %7 = arith.addi %c144_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %9 = arith.select %8, %0, %5 : i32
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
      %19 = arith.addi %c12_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %21 = simt_step.lane_id
      %22 = arith.index_cast %21 : index to i32
      %23 = "simt_step.switch"(%20, %22) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %36 = arith.addi %c16_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_14 : i32
        %39 = "simt_step.if"(%38) ({
          %c3_i32 = arith.constant 3 : i32
          %60 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%60) : (i32) -> ()
        }, {
          %c4_i32_24 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_24) : (i32) -> ()
        }) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %40 = arith.addi %c160_i32, %0 : i32
        %true_15 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      ^bb1(%42: i32):  // no predecessors
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_24 = arith.constant 4 : i32
          %60 = arith.muli %arg5, %c4_i32_24 : i32
          %61 = arith.addi %60, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %62 = arith.addi %c20_i32, %61 : i32
          %63 = "simt_step.buffer.load"(%arg1, %62) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_25 = arith.constant 0 : i32
          %64 = arith.cmpi ne, %63, %c0_i32_25 : i32
          "simt_step.condition"(%64, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %60 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %61 = arith.addi %arg5, %c1_i32 : i32
          %true_24 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %c4_i32_25 = arith.constant 4 : i32
          %62 = arith.muli %arg5, %c4_i32_25 : i32
          %63 = arith.addi %c176_i32, %62 : i32
          %64 = arith.addi %63, %0 : i32
          %true_26 = arith.constant true
          %65 = "simt_step.wave_count_bits"(%true_26) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %64, %65) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%60, %61) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_18 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %44 = arith.addi %c192_i32, %0 : i32
        %true_19 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%46: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %47 = arith.addi %c40_i32, %0 : i32
        %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_20 = arith.constant 0 : i32
        %49 = arith.cmpi ne, %48, %c0_i32_20 : i32
        %50 = "simt_step.if"(%49) ({
          %60 = simt_step.lane_id
          %61 = arith.index_cast %60 : index to i32
          "simt_step.yield"(%61) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c208_i32 = arith.constant 208 : i32
        %51 = arith.addi %c208_i32, %0 : i32
        %true_21 = arith.constant true
        %52 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%50) {fallthrough = true} : (i32) -> ()
      ^bb3(%53: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %54 = arith.addi %c44_i32, %0 : i32
        %55 = "simt_step.buffer.load"(%arg1, %54) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_22 = arith.constant 0 : i32
        %56 = arith.cmpi ne, %55, %c0_i32_22 : i32
        %57 = "simt_step.if"(%56) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %60 = simt_step.lane_id
          %61 = arith.index_cast %60 : index to i32
          "simt_step.yield"(%61) : (i32) -> ()
        }) : (i1) -> i32
        %c224_i32 = arith.constant 224 : i32
        %58 = arith.addi %c224_i32, %0 : i32
        %true_23 = arith.constant true
        %59 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb1(%24: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %25:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %36 = arith.muli %arg4, %c4_i32_14 : i32
        %37 = arith.addi %36, %0 : i32
        %c48_i32 = arith.constant 48 : i32
        %38 = arith.addi %c48_i32, %37 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_15 : i32
        "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %36 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %37 = arith.addi %arg4, %c1_i32 : i32
        %true_14 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %c4_i32_15 = arith.constant 4 : i32
        %38 = arith.muli %arg4, %c4_i32_15 : i32
        %39 = arith.addi %c240_i32, %38 : i32
        %40 = arith.addi %39, %0 : i32
        %true_16 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36, %37) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %27 = arith.addi %c68_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %29 = "simt_step.switch"(%28, %c0_i32_7) ({
      ^bb0(%arg3: i32):
        %36 = simt_step.lane_id
        %37 = arith.index_cast %36 : index to i32
        %true_14 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %38 = arith.addi %c256_i32, %0 : i32
        %true_15 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb1(%40: i32):  // no predecessors
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %41:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %42 = arith.muli %arg5, %c4_i32_18 : i32
          %43 = arith.addi %42, %0 : i32
          %c72_i32 = arith.constant 72 : i32
          %44 = arith.addi %c72_i32, %43 : i32
          %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %46 = arith.cmpi ne, %45, %c0_i32_19 : i32
          "simt_step.condition"(%46, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %42 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %43 = arith.addi %arg5, %c1_i32 : i32
          %true_18 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_19 : i32
          %45 = arith.addi %c272_i32, %44 : i32
          %46 = arith.addi %45, %0 : i32
          %true_20 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42, %43) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%41#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %30 = arith.addi %c288_i32, %0 : i32
      %true_9 = arith.constant true
      %31 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    ^bb3(%32: i32):  // no predecessors
      %c0_i32_10 = arith.constant 0 : i32
      %c0_i32_11 = arith.constant 0 : i32
      %33:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %36 = arith.muli %arg4, %c4_i32_14 : i32
        %37 = arith.addi %36, %0 : i32
        %c92_i32 = arith.constant 92 : i32
        %38 = arith.addi %c92_i32, %37 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_15 : i32
        "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c112_i32 = arith.constant 112 : i32
        %36 = arith.addi %c112_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %38 = "simt_step.switch"(%37, %c0_i32_14) ({
        ^bb0(%arg5: i32):
          %47 = simt_step.subgroup_id
          %48 = arith.index_cast %47 : index to i32
          "simt_step.yield"(%48) {fallthrough = true} : (i32) -> ()
        ^bb1(%49: i32):  // no predecessors
          %50 = simt_step.lane_id
          %51 = arith.index_cast %50 : index to i32
          %true_20 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %52 = arith.addi %c304_i32, %0 : i32
          %true_21 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %39 = arith.addi %c320_i32, %0 : i32
        %true_16 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %41 = arith.addi %arg3, %38 : i32
        %c1_i32 = arith.constant 1 : i32
        %42 = arith.addi %arg4, %c1_i32 : i32
        %true_17 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %c4_i32_18 = arith.constant 4 : i32
        %43 = arith.muli %arg4, %c4_i32_18 : i32
        %44 = arith.addi %c336_i32, %43 : i32
        %45 = arith.addi %44, %0 : i32
        %true_19 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41, %42) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_12 = arith.constant true
      %c352_i32 = arith.constant 352 : i32
      %34 = arith.addi %c352_i32, %0 : i32
      %true_13 = arith.constant true
      %35 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%33#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c368_i32 = arith.constant 368 : i32
    %10 = arith.addi %c368_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c116_i32 = arith.constant 116 : i32
    %12 = arith.addi %c116_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %14 = arith.cmpi ne, %13, %c0_i32_1 : i32
    %15 = "simt_step.if"(%14) ({
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32) : (i32) -> ()
    }, {
      %c120_i32 = arith.constant 120 : i32
      %19 = arith.addi %c120_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %21 = simt_step.subgroup_id
      %22 = arith.index_cast %21 : index to i32
      %23 = "simt_step.switch"(%20, %22) ({
      ^bb0(%arg2: i32):
        %c124_i32 = arith.constant 124 : i32
        %24 = arith.addi %c124_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %26 = simt_step.lane_id
        %27 = arith.index_cast %26 : index to i32
        %28 = "simt_step.switch"(%25, %27) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %39 = simt_step.subgroup_id
          %40 = arith.index_cast %39 : index to i32
          "simt_step.yield"(%40) {fallthrough = true} : (i32) -> ()
        ^bb2(%41: i32):  // no predecessors
          %true_9 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %42 = arith.addi %c384_i32, %0 : i32
          %true_10 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%44: i32):  // no predecessors
          %45 = simt_step.lane_id
          %46 = arith.index_cast %45 : index to i32
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %29 = arith.addi %c400_i32, %0 : i32
        %true_6 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c128_i32 = arith.constant 128 : i32
        %32 = arith.addi %c128_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_7 : i32
        %35 = "simt_step.if"(%34) ({
          %38 = simt_step.lane_id
          %39 = arith.index_cast %38 : index to i32
          "simt_step.yield"(%39) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c416_i32 = arith.constant 416 : i32
        %36 = arith.addi %c416_i32, %0 : i32
        %true_8 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%23) : (i32) -> ()
    }) : (i1) -> i32
    %c432_i32 = arith.constant 432 : i32
    %16 = arith.addi %c432_i32, %0 : i32
    %true_2 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %18:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %19 = arith.muli %arg3, %c4_i32_5 : i32
      %20 = arith.addi %19, %0 : i32
      %c132_i32 = arith.constant 132 : i32
      %21 = arith.addi %c132_i32, %20 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_6 : i32
      "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %19 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %arg3, %c1_i32 : i32
      %true_5 = arith.constant true
      %c448_i32 = arith.constant 448 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %21 = arith.muli %arg3, %c4_i32_6 : i32
      %22 = arith.addi %c448_i32, %21 : i32
      %23 = arith.addi %22, %0 : i32
      %true_7 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19, %20) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

